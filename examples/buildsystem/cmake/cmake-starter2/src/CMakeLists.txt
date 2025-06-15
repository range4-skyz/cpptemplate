# Generate target source files
add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME}
    PRIVATE
    main.cpp
    # add more...
)

# include config.h
target_include_directories(${PROJECT_NAME} PUBLIC "${PROJECT_BINARY_DIR}/include")

# Generate pch files and be force included to source files
target_precompile_headers(${PROJECT_NAME} PRIVATE
    $<$<COMPILE_LANGUAGE:C>:   ${CMAKE_CURRENT_SOURCE_DIR}/pch/c_pch.h>
    $<$<COMPILE_LANGUAGE:CXX>: ${CMAKE_CURRENT_SOURCE_DIR}/pch/cpp_pch.hpp>
)

# Add compile options to source files
target_compile_options(${PROJECT_NAME} PRIVATE
    $<$<COMPILE_LANGUAGE:C>:    ${cflags}>
    $<$<COMPILE_LANGUAGE:CXX>:  ${cxxflags}>
)

# Add link options to source files
target_link_options(${PROJECT_NAME} PRIVATE ${link_args})

# Link libraries to source files
target_link_libraries(${PROJECT_NAME} PUBLIC fmt::fmt)
target_link_libraries(${PROJECT_NAME} PUBLIC nlohmann_json::nlohmann_json)
# add more...
