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
CMAKE_SOURCE_DIR = /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build

# Utility rule file for partition_table_bin.

# Include any custom commands dependencies for this target.
include esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/progress.make

esp-idf/partition_table/CMakeFiles/partition_table_bin: partition_table/partition-table.bin
esp-idf/partition_table/CMakeFiles/partition_table_bin: partition_table/partition-table.bin

partition_table/partition-table.bin: /Users/jpedroriverop/esp/esp-idf/components/partition_table/partitions_singleapp.csv
partition_table/partition-table.bin: /Users/jpedroriverop/esp/esp-idf/components/partition_table/gen_esp32part.py
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../../partition_table/partition-table.bin"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/partition_table && /Users/jpedroriverop/.espressif/python_env/idf5.5_py3.9_env/bin/python /Users/jpedroriverop/esp/esp-idf/components/partition_table/gen_esp32part.py -q --offset 0x8000 --primary-bootloader-offset 0x1000 --flash-size 2MB -- /Users/jpedroriverop/esp/esp-idf/components/partition_table/partitions_singleapp.csv /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/partition_table/partition-table.bin
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/partition_table && /opt/homebrew/bin/cmake -E echo "Partition table binary generated. Contents:"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/partition_table && /opt/homebrew/bin/cmake -E echo "*******************************************************************************"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/partition_table && /Users/jpedroriverop/.espressif/python_env/idf5.5_py3.9_env/bin/python /Users/jpedroriverop/esp/esp-idf/components/partition_table/gen_esp32part.py -q --offset 0x8000 --primary-bootloader-offset 0x1000 --flash-size 2MB -- /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/partition_table/partition-table.bin
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/partition_table && /opt/homebrew/bin/cmake -E echo "*******************************************************************************"

esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/codegen:
.PHONY : esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/codegen

partition_table_bin: esp-idf/partition_table/CMakeFiles/partition_table_bin
partition_table_bin: partition_table/partition-table.bin
partition_table_bin: esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/build.make
.PHONY : partition_table_bin

# Rule to build all files generated by this target.
esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/build: partition_table_bin
.PHONY : esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/build

esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/clean:
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/partition_table && $(CMAKE_COMMAND) -P CMakeFiles/partition_table_bin.dir/cmake_clean.cmake
.PHONY : esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/clean

esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/depend:
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido /Users/jpedroriverop/esp/esp-idf/components/partition_table /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/partition_table /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : esp-idf/partition_table/CMakeFiles/partition_table_bin.dir/depend

