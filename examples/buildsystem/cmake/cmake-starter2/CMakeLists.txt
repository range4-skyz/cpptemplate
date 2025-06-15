cmake_minimum_required(VERSION 3.16...4.0)
project(cmake-starter 
        LANGUAGES C CXX
        VERSION 1.0.0)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# Set C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Set warning levels
add_compile_options(-Wall -Wextra)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)   # for generating compile_command.json
# set(CMAKE_EXECUTABLE_ENABLE_EXPORTS ON) # specify whether executables export symbols for loadable modules. (>=3.24)

# Enable color diagnostics
if(CMAKE_VERSION VERSION_LESS "3.24")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdiagnostics-color=always")
else()
    set(CMAKE_COLOR_DIAGNOSTICS ON)
endif()

# Generate config.h
# https://cmake.org/cmake/help/latest/command/configure_file.html#command:configure_file
execute_process(
    COMMAND git rev-parse --short HEAD
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_VARIABLE GIT_COMMIT_HASH
    OUTPUT_STRIP_TRAILING_WHITESPACE)

configure_file(
    ${PROJECT_SOURCE_DIR}/src/config.h.in
    ${PROJECT_BINARY_DIR}/include/config.h
    @ONLY)

################################################################################
# Dependencies
# - https://cmake.org/cmake/help/latest/command/find_package.html#command:find_package
# - nlohmann_json   : https://json.nlohmann.me/integration/cmake/
# - fmt             : https://fmt.dev/11.1/get-started/#cmake

find_package(fmt            11.2.0 REQUIRED)
find_package(nlohmann_json  3.12.0)
# add more...

################################################################################
# Compiler flags

if(CMAKE_CXX_COMPILER_ID MATCHES "CLANG" AND NOT CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 16.0.0)
    message(FATAL_ERROR "This project only supports gcc or clang >= 16 compilers due to usage of c++20 features.")
endif()

list(APPEND common_flags
    -Wno-unused-parameter
    # -Wno-unused-value
    # -Wunused-function
    # -Wno-narrowing
    # -Wno-missing-field-initializers
    # -Wno-unknown-warning-option # only Clang
    -Werror=vla
    -Werror=div-by-zero
)

list(APPEND extra_cflags
    -Wmissing-prototypes
    -Wnested-externs
    # -Werror=restrict # only GCC
)

list(APPEND extra_cxxflags
    -Werror=uninitialized
    # -Werror=maybe-uninitialized # only GCC
    -Werror=missing-declarations
    -Werror=missing-field-initializers
    -Werror=address
    -Werror=pointer-arith
    -Werror=reorder
    -Werror=overflow
    -Werror=shift-overflow
    -Werror=multichar
    -Werror=write-strings
    -Werror=string-compare
    # -Werror=bool-compare # only GCC
    -Werror=bool-operation
    -Werror=conversion-null
    -Werror=float-conversion
    -Werror=deprecated-copy
    -Werror=deprecated-copy-dtor
    -Werror=mismatched-new-delete
    # -Werror=zero-length-bounds    # only GCC
    # -Werror=invalid-memory-model  # only GCC
    # -Werror=class-memaccess       # only GCC
)

set(cflags      ${common_flags} ${extra_cflags})
set(cxxflags    ${common_flags} ${extra_cxxflags})

# If mold <=1.10.1, may need add '-Wl,--no-as-needed', more details: https://github.com/rui314/mold/issues/1017
option(ENABLE_MOLD "Enable mold linker" OFF)

if(ENABLE_MOLD)
    set(link_args -fuse-ld=mold -Wl,--no-as-needed)
else()
    set(link_args "")
endif()

################################################################################
# Subdirectories

include_directories(include)

add_subdirectory(src)

# Print status
message(STATUS "")
message(STATUS "-----")
message(STATUS "${PROJECT_NAME} ${PROJECT_VERSION}")
message(STATUS "Configuration:")
message(STATUS "        Source code location:   ${CMAKE_SOURCE_DIR}")
message(STATUS "        C Compiler:             ${CMAKE_C_COMPILER} ${CMAKE_C_COMPILER_VERSION}")
message(STATUS "        C++ Compiler:           ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_COMPILER_VERSION}")
message(STATUS "        CFLAGS:                 ${cflags}")
message(STATUS "        CXXFLAGS:               ${cxxflags}")
