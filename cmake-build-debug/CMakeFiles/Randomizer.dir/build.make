# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /cygdrive/c/Users/zoosh/.CLion2019.3/system/cygwin_cmake/bin/cmake.exe

# The command to remove a file.
RM = /cygdrive/c/Users/zoosh/.CLion2019.3/system/cygwin_cmake/bin/cmake.exe -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /cygdrive/c/Users/zoosh/CLionProjects/Randomizer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /cygdrive/c/Users/zoosh/CLionProjects/Randomizer/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Randomizer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Randomizer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Randomizer.dir/flags.make

CMakeFiles/Randomizer.dir/main.cpp.o: CMakeFiles/Randomizer.dir/flags.make
CMakeFiles/Randomizer.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/cygdrive/c/Users/zoosh/CLionProjects/Randomizer/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Randomizer.dir/main.cpp.o"
	C:/cygwin64/bin/c++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Randomizer.dir/main.cpp.o -c /cygdrive/c/Users/zoosh/CLionProjects/Randomizer/main.cpp

CMakeFiles/Randomizer.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Randomizer.dir/main.cpp.i"
	C:/cygwin64/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /cygdrive/c/Users/zoosh/CLionProjects/Randomizer/main.cpp > CMakeFiles/Randomizer.dir/main.cpp.i

CMakeFiles/Randomizer.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Randomizer.dir/main.cpp.s"
	C:/cygwin64/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /cygdrive/c/Users/zoosh/CLionProjects/Randomizer/main.cpp -o CMakeFiles/Randomizer.dir/main.cpp.s

# Object files for target Randomizer
Randomizer_OBJECTS = \
"CMakeFiles/Randomizer.dir/main.cpp.o"

# External object files for target Randomizer
Randomizer_EXTERNAL_OBJECTS =

Randomizer.exe: CMakeFiles/Randomizer.dir/main.cpp.o
Randomizer.exe: CMakeFiles/Randomizer.dir/build.make
Randomizer.exe: CMakeFiles/Randomizer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/cygdrive/c/Users/zoosh/CLionProjects/Randomizer/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Randomizer.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Randomizer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Randomizer.dir/build: Randomizer.exe

.PHONY : CMakeFiles/Randomizer.dir/build

CMakeFiles/Randomizer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Randomizer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Randomizer.dir/clean

CMakeFiles/Randomizer.dir/depend:
	cd /cygdrive/c/Users/zoosh/CLionProjects/Randomizer/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /cygdrive/c/Users/zoosh/CLionProjects/Randomizer /cygdrive/c/Users/zoosh/CLionProjects/Randomizer /cygdrive/c/Users/zoosh/CLionProjects/Randomizer/cmake-build-debug /cygdrive/c/Users/zoosh/CLionProjects/Randomizer/cmake-build-debug /cygdrive/c/Users/zoosh/CLionProjects/Randomizer/cmake-build-debug/CMakeFiles/Randomizer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Randomizer.dir/depend

