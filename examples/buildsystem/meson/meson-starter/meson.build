project(
  'meson_starter', # project name
  'cpp', # language
  # version: '1.0.0',
  version: run_command('cat', join_paths(meson.project_source_root(), 'VERSION'), check: true).stdout().strip(),
  license: 'MIT',
  default_options: [
    'warning_level=2',
    'optimization=3',
    'cpp_std=c++20',
  ],
)

add_project_arguments(
  [
    '-Wno-unknown-warning-option',
    '-Werror=div-by-zero',
    '-Werror=vla',
    '-Werror=restrict',
  ],
  language: 'cpp',
)

subdir('src')
