# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/2.8.12.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/2.8.12.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/local/Cellar/cmake/2.8.12/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/eugenioculurciello/Code/Lua/luasdl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/eugenioculurciello/Code/Lua/luasdl

# Include any dependencies generated for this target.
include CMakeFiles/luasdl.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/luasdl.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/luasdl.dir/flags.make

CMakeFiles/luasdl.dir/sdl_api.c.o: CMakeFiles/luasdl.dir/flags.make
CMakeFiles/luasdl.dir/sdl_api.c.o: sdl_api.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/eugenioculurciello/Code/Lua/luasdl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/luasdl.dir/sdl_api.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/luasdl.dir/sdl_api.c.o   -c /Users/eugenioculurciello/Code/Lua/luasdl/sdl_api.c

CMakeFiles/luasdl.dir/sdl_api.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/luasdl.dir/sdl_api.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/eugenioculurciello/Code/Lua/luasdl/sdl_api.c > CMakeFiles/luasdl.dir/sdl_api.c.i

CMakeFiles/luasdl.dir/sdl_api.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/luasdl.dir/sdl_api.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/eugenioculurciello/Code/Lua/luasdl/sdl_api.c -o CMakeFiles/luasdl.dir/sdl_api.c.s

CMakeFiles/luasdl.dir/sdl_api.c.o.requires:
.PHONY : CMakeFiles/luasdl.dir/sdl_api.c.o.requires

CMakeFiles/luasdl.dir/sdl_api.c.o.provides: CMakeFiles/luasdl.dir/sdl_api.c.o.requires
	$(MAKE) -f CMakeFiles/luasdl.dir/build.make CMakeFiles/luasdl.dir/sdl_api.c.o.provides.build
.PHONY : CMakeFiles/luasdl.dir/sdl_api.c.o.provides

CMakeFiles/luasdl.dir/sdl_api.c.o.provides.build: CMakeFiles/luasdl.dir/sdl_api.c.o

# Object files for target luasdl
luasdl_OBJECTS = \
"CMakeFiles/luasdl.dir/sdl_api.c.o"

# External object files for target luasdl
luasdl_EXTERNAL_OBJECTS =

libluasdl.dylib: CMakeFiles/luasdl.dir/sdl_api.c.o
libluasdl.dylib: CMakeFiles/luasdl.dir/build.make
libluasdl.dylib: CMakeFiles/luasdl.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared library libluasdl.dylib"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/luasdl.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/luasdl.dir/build: libluasdl.dylib
.PHONY : CMakeFiles/luasdl.dir/build

CMakeFiles/luasdl.dir/requires: CMakeFiles/luasdl.dir/sdl_api.c.o.requires
.PHONY : CMakeFiles/luasdl.dir/requires

CMakeFiles/luasdl.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/luasdl.dir/cmake_clean.cmake
.PHONY : CMakeFiles/luasdl.dir/clean

CMakeFiles/luasdl.dir/depend:
	cd /Users/eugenioculurciello/Code/Lua/luasdl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/eugenioculurciello/Code/Lua/luasdl /Users/eugenioculurciello/Code/Lua/luasdl /Users/eugenioculurciello/Code/Lua/luasdl /Users/eugenioculurciello/Code/Lua/luasdl /Users/eugenioculurciello/Code/Lua/luasdl/CMakeFiles/luasdl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/luasdl.dir/depend

