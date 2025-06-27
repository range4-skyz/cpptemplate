meson_starter_sources = [
    'main.cpp',
    # add more...
]

meson_starter_dependencies = [
    fmt,
    nlohmann_json,
    # add more...
]

executable(meson.project_name(), meson_starter_sources,
                cpp_pch: 'pch/cpp_pch.hpp',   # only applicable to GCC
    include_directories: [ include_dir ],
           dependencies: [ meson_starter_dependencies ],
              link_args: link_args,
                install: true
)
