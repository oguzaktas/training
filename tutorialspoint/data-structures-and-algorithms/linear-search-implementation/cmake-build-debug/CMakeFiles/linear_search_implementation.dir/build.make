# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

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
CMAKE_COMMAND = /home/oguz/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/202.7319.72/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/oguz/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/202.7319.72/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/oguz/CLionProjects/linear-search-implementation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/oguz/CLionProjects/linear-search-implementation/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/linear_search_implementation.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/linear_search_implementation.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/linear_search_implementation.dir/flags.make

CMakeFiles/linear_search_implementation.dir/main.c.o: CMakeFiles/linear_search_implementation.dir/flags.make
CMakeFiles/linear_search_implementation.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oguz/CLionProjects/linear-search-implementation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/linear_search_implementation.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/linear_search_implementation.dir/main.c.o   -c /home/oguz/CLionProjects/linear-search-implementation/main.c

CMakeFiles/linear_search_implementation.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/linear_search_implementation.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/oguz/CLionProjects/linear-search-implementation/main.c > CMakeFiles/linear_search_implementation.dir/main.c.i

CMakeFiles/linear_search_implementation.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/linear_search_implementation.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/oguz/CLionProjects/linear-search-implementation/main.c -o CMakeFiles/linear_search_implementation.dir/main.c.s

# Object files for target linear_search_implementation
linear_search_implementation_OBJECTS = \
"CMakeFiles/linear_search_implementation.dir/main.c.o"

# External object files for target linear_search_implementation
linear_search_implementation_EXTERNAL_OBJECTS =

linear_search_implementation: CMakeFiles/linear_search_implementation.dir/main.c.o
linear_search_implementation: CMakeFiles/linear_search_implementation.dir/build.make
linear_search_implementation: CMakeFiles/linear_search_implementation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/oguz/CLionProjects/linear-search-implementation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable linear_search_implementation"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/linear_search_implementation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/linear_search_implementation.dir/build: linear_search_implementation

.PHONY : CMakeFiles/linear_search_implementation.dir/build

CMakeFiles/linear_search_implementation.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/linear_search_implementation.dir/cmake_clean.cmake
.PHONY : CMakeFiles/linear_search_implementation.dir/clean

CMakeFiles/linear_search_implementation.dir/depend:
	cd /home/oguz/CLionProjects/linear-search-implementation/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oguz/CLionProjects/linear-search-implementation /home/oguz/CLionProjects/linear-search-implementation /home/oguz/CLionProjects/linear-search-implementation/cmake-build-debug /home/oguz/CLionProjects/linear-search-implementation/cmake-build-debug /home/oguz/CLionProjects/linear-search-implementation/cmake-build-debug/CMakeFiles/linear_search_implementation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/linear_search_implementation.dir/depend

