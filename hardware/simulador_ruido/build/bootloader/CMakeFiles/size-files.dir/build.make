# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/jpedroriverop/esp/esp-idf/components/bootloader/subproject

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/bootloader

# Utility rule file for size-files.

# Include any custom commands dependencies for this target.
include CMakeFiles/size-files.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/size-files.dir/progress.make

CMakeFiles/size-files: bootloader.map
	/opt/homebrew/bin/cmake -D "IDF_SIZE_TOOL=/Users/jpedroriverop/.espressif/python_env/idf5.5_py3.9_env/bin/python;-m;esp_idf_size" -D IDF_SIZE_MODE=--files -D MAP_FILE=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/bootloader/bootloader.map -D OUTPUT_JSON= -P /Users/jpedroriverop/esp/esp-idf/tools/cmake/run_size_tool.cmake

CMakeFiles/size-files.dir/codegen:
.PHONY : CMakeFiles/size-files.dir/codegen

size-files: CMakeFiles/size-files
size-files: CMakeFiles/size-files.dir/build.make
.PHONY : size-files

# Rule to build all files generated by this target.
CMakeFiles/size-files.dir/build: size-files
.PHONY : CMakeFiles/size-files.dir/build

CMakeFiles/size-files.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/size-files.dir/cmake_clean.cmake
.PHONY : CMakeFiles/size-files.dir/clean

CMakeFiles/size-files.dir/depend:
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/bootloader && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jpedroriverop/esp/esp-idf/components/bootloader/subproject /Users/jpedroriverop/esp/esp-idf/components/bootloader/subproject /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/bootloader /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/bootloader /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/bootloader/CMakeFiles/size-files.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/size-files.dir/depend

