add_executable(cmake-starter)

target_sources(cmake-starter
    PRIVATE
    main.cpp
)

# Get the last commit hash
execute_process(
    COMMAND git rev-parse --short HEAD
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_VARIABLE GIT_COMMIT_HASH
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/ConfigVersion.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/ConfigVersion.h
    @ONLY
)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
