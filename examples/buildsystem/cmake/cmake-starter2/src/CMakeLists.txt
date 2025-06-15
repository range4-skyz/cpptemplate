# Generate config.h
set(VERSION "${PROJECT_VERSION}")

execute_process(
    COMMAND git rev-parse --short HEAD
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_VARIABLE GIT_COMMIT_HASH
    OUTPUT_STRIP_TRAILING_WHITESPACE)

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/config.h.in
    ${CMAKE_BINARY_DIR}/config.h
    @ONLY)


add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME}
    PRIVATE
    main.cpp
    # add more...
)

# include config.h
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_BINARY_DIR})

# add compile options
target_compile_options(${PROJECT_NAME}
  PRIVATE
    $<$<COMPILE_LANGUAGE:C>:    ${cflags}>
    $<$<COMPILE_LANGUAGE:CXX>:  ${cxxflags}>
)

# add link options
target_link_options(${PROJECT_NAME} PRIVATE ${link_args})

# link libraries
target_link_libraries(${PROJECT_NAME} PRIVATE fmt::fmt)
target_link_libraries(${PROJECT_NAME} PRIVATE nlohmann_json::nlohmann_json)
# add more...
