waydbg_sources = [
    'main.cpp',
    # add more...
]

waydbg_dependencies = [
    fmt,
    nlohmann_json,
    # add more...
]

executable(meson.project_name(), waydbg_sources,
                cpp_pch: 'pch/cpp_pch.hpp',   # only applicable to GCC
    include_directories: [ include_dir ],
           dependencies: [ waydbg_dependencies ],
              link_args: link_args,
                install: true
)
