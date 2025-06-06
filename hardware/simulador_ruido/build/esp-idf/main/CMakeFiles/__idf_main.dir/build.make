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

# Include any dependencies generated for this target.
include esp-idf/main/CMakeFiles/__idf_main.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include esp-idf/main/CMakeFiles/__idf_main.dir/compiler_depend.make

# Include the progress variables for this target.
include esp-idf/main/CMakeFiles/__idf_main.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/main/CMakeFiles/__idf_main.dir/flags.make

ca_cert.pem.S: /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main/ca_cert.pem
ca_cert.pem.S: /Users/jpedroriverop/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../../ca_cert.pem.S"
	/opt/homebrew/bin/cmake -D DATA_FILE=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main/ca_cert.pem -D SOURCE_FILE=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/ca_cert.pem.S -D FILE_TYPE=TEXT -P /Users/jpedroriverop/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake

client_cert.pem.S: /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main/client_cert.pem
client_cert.pem.S: /Users/jpedroriverop/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating ../../client_cert.pem.S"
	/opt/homebrew/bin/cmake -D DATA_FILE=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main/client_cert.pem -D SOURCE_FILE=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/client_cert.pem.S -D FILE_TYPE=TEXT -P /Users/jpedroriverop/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake

client_key.pem.S: /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main/client_key.pem
client_key.pem.S: /Users/jpedroriverop/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating ../../client_key.pem.S"
	/opt/homebrew/bin/cmake -D DATA_FILE=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main/client_key.pem -D SOURCE_FILE=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/client_key.pem.S -D FILE_TYPE=TEXT -P /Users/jpedroriverop/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake

esp-idf/main/CMakeFiles/__idf_main.dir/codegen:
.PHONY : esp-idf/main/CMakeFiles/__idf_main.dir/codegen

esp-idf/main/CMakeFiles/__idf_main.dir/simulador_ruido.c.obj: esp-idf/main/CMakeFiles/__idf_main.dir/flags.make
esp-idf/main/CMakeFiles/__idf_main.dir/simulador_ruido.c.obj: /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main/simulador_ruido.c
esp-idf/main/CMakeFiles/__idf_main.dir/simulador_ruido.c.obj: esp-idf/main/CMakeFiles/__idf_main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object esp-idf/main/CMakeFiles/__idf_main.dir/simulador_ruido.c.obj"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT esp-idf/main/CMakeFiles/__idf_main.dir/simulador_ruido.c.obj -MF CMakeFiles/__idf_main.dir/simulador_ruido.c.obj.d -o CMakeFiles/__idf_main.dir/simulador_ruido.c.obj -c /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main/simulador_ruido.c

esp-idf/main/CMakeFiles/__idf_main.dir/simulador_ruido.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/__idf_main.dir/simulador_ruido.c.i"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main/simulador_ruido.c > CMakeFiles/__idf_main.dir/simulador_ruido.c.i

esp-idf/main/CMakeFiles/__idf_main.dir/simulador_ruido.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/__idf_main.dir/simulador_ruido.c.s"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main/simulador_ruido.c -o CMakeFiles/__idf_main.dir/simulador_ruido.c.s

esp-idf/main/CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.obj: esp-idf/main/CMakeFiles/__idf_main.dir/flags.make
esp-idf/main/CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.obj: ca_cert.pem.S
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building ASM object esp-idf/main/CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.obj"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.obj -c /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/ca_cert.pem.S

esp-idf/main/CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing ASM source to CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.i"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/ca_cert.pem.S > CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.i

esp-idf/main/CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling ASM source to assembly CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.s"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/ca_cert.pem.S -o CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.s

esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.obj: esp-idf/main/CMakeFiles/__idf_main.dir/flags.make
esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.obj: client_cert.pem.S
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building ASM object esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.obj"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.obj -c /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/client_cert.pem.S

esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing ASM source to CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.i"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/client_cert.pem.S > CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.i

esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling ASM source to assembly CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.s"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/client_cert.pem.S -o CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.s

esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.obj: esp-idf/main/CMakeFiles/__idf_main.dir/flags.make
esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.obj: client_key.pem.S
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building ASM object esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.obj"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.obj -c /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/client_key.pem.S

esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing ASM source to CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.i"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/client_key.pem.S > CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.i

esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling ASM source to assembly CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.s"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && /Users/jpedroriverop/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/client_key.pem.S -o CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.s

# Object files for target __idf_main
__idf_main_OBJECTS = \
"CMakeFiles/__idf_main.dir/simulador_ruido.c.obj" \
"CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.obj" \
"CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.obj" \
"CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.obj"

# External object files for target __idf_main
__idf_main_EXTERNAL_OBJECTS =

esp-idf/main/libmain.a: esp-idf/main/CMakeFiles/__idf_main.dir/simulador_ruido.c.obj
esp-idf/main/libmain.a: esp-idf/main/CMakeFiles/__idf_main.dir/__/__/ca_cert.pem.S.obj
esp-idf/main/libmain.a: esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_cert.pem.S.obj
esp-idf/main/libmain.a: esp-idf/main/CMakeFiles/__idf_main.dir/__/__/client_key.pem.S.obj
esp-idf/main/libmain.a: esp-idf/main/CMakeFiles/__idf_main.dir/build.make
esp-idf/main/libmain.a: esp-idf/main/CMakeFiles/__idf_main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C static library libmain.a"
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && $(CMAKE_COMMAND) -P CMakeFiles/__idf_main.dir/cmake_clean_target.cmake
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/main/CMakeFiles/__idf_main.dir/build: esp-idf/main/libmain.a
.PHONY : esp-idf/main/CMakeFiles/__idf_main.dir/build

esp-idf/main/CMakeFiles/__idf_main.dir/clean:
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main && $(CMAKE_COMMAND) -P CMakeFiles/__idf_main.dir/cmake_clean.cmake
.PHONY : esp-idf/main/CMakeFiles/__idf_main.dir/clean

esp-idf/main/CMakeFiles/__idf_main.dir/depend: ca_cert.pem.S
esp-idf/main/CMakeFiles/__idf_main.dir/depend: client_cert.pem.S
esp-idf/main/CMakeFiles/__idf_main.dir/depend: client_key.pem.S
	cd /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/main /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main /Users/jpedroriverop/proyectos/proyecto-ruido-iot/hardware/simulador_ruido/build/esp-idf/main/CMakeFiles/__idf_main.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : esp-idf/main/CMakeFiles/__idf_main.dir/depend

