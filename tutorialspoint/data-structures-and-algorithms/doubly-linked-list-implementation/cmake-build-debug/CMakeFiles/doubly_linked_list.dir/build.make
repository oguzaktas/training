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
CMAKE_SOURCE_DIR = /home/oguz/CLionProjects/doubly-linked-list-implementation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/oguz/CLionProjects/doubly-linked-list-implementation/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/doubly_linked_list.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/doubly_linked_list.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/doubly_linked_list.dir/flags.make

CMakeFiles/doubly_linked_list.dir/main.c.o: CMakeFiles/doubly_linked_list.dir/flags.make
CMakeFiles/doubly_linked_list.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oguz/CLionProjects/doubly-linked-list-implementation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/doubly_linked_list.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/doubly_linked_list.dir/main.c.o   -c /home/oguz/CLionProjects/doubly-linked-list-implementation/main.c

CMakeFiles/doubly_linked_list.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/doubly_linked_list.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/oguz/CLionProjects/doubly-linked-list-implementation/main.c > CMakeFiles/doubly_linked_list.dir/main.c.i

CMakeFiles/doubly_linked_list.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/doubly_linked_list.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/oguz/CLionProjects/doubly-linked-list-implementation/main.c -o CMakeFiles/doubly_linked_list.dir/main.c.s

# Object files for target doubly_linked_list
doubly_linked_list_OBJECTS = \
"CMakeFiles/doubly_linked_list.dir/main.c.o"

# External object files for target doubly_linked_list
doubly_linked_list_EXTERNAL_OBJECTS =

doubly_linked_list: CMakeFiles/doubly_linked_list.dir/main.c.o
doubly_linked_list: CMakeFiles/doubly_linked_list.dir/build.make
doubly_linked_list: CMakeFiles/doubly_linked_list.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/oguz/CLionProjects/doubly-linked-list-implementation/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable doubly_linked_list"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/doubly_linked_list.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/doubly_linked_list.dir/build: doubly_linked_list

.PHONY : CMakeFiles/doubly_linked_list.dir/build

CMakeFiles/doubly_linked_list.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/doubly_linked_list.dir/cmake_clean.cmake
.PHONY : CMakeFiles/doubly_linked_list.dir/clean

CMakeFiles/doubly_linked_list.dir/depend:
	cd /home/oguz/CLionProjects/doubly-linked-list-implementation/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oguz/CLionProjects/doubly-linked-list-implementation /home/oguz/CLionProjects/doubly-linked-list-implementation /home/oguz/CLionProjects/doubly-linked-list-implementation/cmake-build-debug /home/oguz/CLionProjects/doubly-linked-list-implementation/cmake-build-debug /home/oguz/CLionProjects/doubly-linked-list-implementation/cmake-build-debug/CMakeFiles/doubly_linked_list.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/doubly_linked_list.dir/depend
