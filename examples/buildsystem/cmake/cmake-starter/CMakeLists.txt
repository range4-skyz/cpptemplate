cmake_minimum_required(VERSION 3.12)
# project(cmake-starter VERSION 1.0.0 LANGUAGES CXX)

file(READ "${CMAKE_CURRENT_SOURCE_DIR}/VERSION" PROJECT_VERSION)
string(STRIP "${PROJECT_VERSION}" PROJECT_VERSION)
project(cmake-starter VERSION ${PROJECT_VERSION} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON) # for generating compile_command.json

set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

# enable color diagnostics
if(CMAKE_VERSION VERSION_LESS "3.24")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdiagnostics-color=always")
else()
    set(CMAKE_COLOR_DIAGNOSTICS ON)
endif()

add_compile_options(
    -Wall
    -Wextra
    -Wno-unknown-warning-option
    -Werror=vla
    -Werror=restrict
    -Werror=div-by-zero
)

add_subdirectory(src)
