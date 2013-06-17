#!/usr/bin/env torch
------------------------------------------------------------
-- a face detector, based on a simple convolutional network,
-- trained end-to-end for that task.
--
-- Clement Farabet
--

require 'xlua'
require 'torch'
require 'inline'
require 'camera'
require 'nnx'
require 'luasdl'

-- parse args
op = xlua.OptionParser('%prog [options]')
op:option{'-c', '--camera', action='store', dest='camidx',
          help='camera index: /dev/videoIDX', default=0}
op:option{'-n', '--network', action='store', dest='network', 
          help='path to existing [trained] network',
          default='face.net.ascii'}
op:option{'-t', '--threshold', action='store', dest='threshold',
          help='threshold', default=0.3}

opt,args = op:parse()
threshold = opt.threshold

torch.setdefaulttensortype('torch.FloatTensor')

torch.setnumthreads(4)

luasdl.init(640, 480, 'face detector')

-- blob parser
parse = inline.load [[
      // get args
      const void* id = luaT_checktypename2id(L, "torch.FloatTensor");
      THFloatTensor *tensor = luaT_checkudata(L, 1, id);
      float threshold = lua_tonumber(L, 2);
      int table_blobs = 3;
      int idx = lua_objlen(L, 3) + 1;
      float scale = lua_tonumber(L, 4);

      // loop over pixels
      int x,y;
      for (y=0; y<tensor->size[0]; y++) {
         for (x=0; x<tensor->size[1]; x++) {
            float val = THFloatTensor_get2d(tensor, y, x);
            if (val > threshold) {
               // entry = {}
               lua_newtable(L);
               int entry = lua_gettop(L);

               // entry[1] = x
               lua_pushnumber(L, x);
               lua_rawseti(L, entry, 1);

               // entry[2] = y
               lua_pushnumber(L, y);
               lua_rawseti(L, entry, 2);

               // entry[3] = scale
               lua_pushnumber(L, scale);
               lua_rawseti(L, entry, 3);

               // blobs[idx] = entry; idx = idx + 1
               lua_rawseti(L, table_blobs, idx++);
            }
         }
      }
      return 0;
]]

-- load pre-trained network from disk
network = nn.Sequential()
network = torch.load(opt.network,'ascii'):float()
network_fov = 32
network_sub = 4

-- setup camera
camera = image.Camera(opt.camidx)

-- process input at multiple scales
scales = {0.3, 0.24, 0.192, 0.15, 0.12, 0.1}

-- use a pyramid packer/unpacker
require 'PyramidPacker'
require 'PyramidUnPacker'
packer = nn.PyramidPacker(network, scales)
unpacker = nn.PyramidUnPacker(network)

-- a gaussian for smoothing the distributions
gaussian = image.gaussian(3,0.15)

-- profiler
p = xlua.Profiler()

-- process function
function process()
   -- (1) grab frame
   frame = camera:forward()

   -- (2) transform it into Y space
   frameY = image.rgb2y(frame)

   -- (3) create multiscale pyramid
   pyramid, coordinates = packer:forward(frameY)

   -- (4) run pre-trained network on it
   multiscale = network:forward(pyramid)

   -- (5) unpack pyramid
   distributions = unpacker:forward(multiscale, coordinates)

   rawresults = {}
   for i,distribution in ipairs(distributions) do
      local smoothed = image.convolve(distribution[1]:add(1):mul(0.5), gaussian)
      parse(smoothed, threshold, rawresults, scales[i])
   end

   -- (7) clean up results
   detections = {}
   for i,res in ipairs(rawresults) do
      local scale = res[3]
      local x = res[1]*network_sub/scale
      local y = res[2]*network_sub/scale
      local w = network_fov/scale
      local h = network_fov/scale
      detections[i] = {x=x, y=y, w=w, h=h}
   end
end

-- display function
function display()

	nframe = frame
    for i,detect in ipairs(detections) do
		nframe = luasdl.addrect(nframe, detect.x, detect.y, detect.w, detect.h, 5, {1, 0, 0})
	end

	luasdl.display(nframe)

end

while true do

      p:start('full loop','fps')
      p:start('prediction','fps')
      process()
      p:lap('prediction')
      p:start('display','fps')
      display()
			
      p:lap('display')
      p:lap('full loop')
      p:printAll()

end

