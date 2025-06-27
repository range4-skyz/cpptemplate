cmake_minimum_required(VERSION 3.12)

# Get project verion
file(READ "${CMAKE_SOURCE_DIR}/VERSION" PROJECT_VER_RAW)
string(STRIP "${PROJECT_VER_RAW}" PROJECT_VERSION)

project(cmake-starter
        VERSION ${PROJECT_VERSION}
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON) # for generating compile_command.json
# set(CMAKE_EXECUTABLE_ENABLE_EXPORTS ON)

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
