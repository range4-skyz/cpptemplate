project('meson_starter', ['c', 'cpp'],
  default_options : [
    'cpp_std=c++20',
    'warning_level=2', # -Wall -Wextra
    # 'optimization=3', # -O3
    # 'buildtype=release',
    # 'default_library=static',
  ],
  version: '1.0.0',
  meson_version: '>=0.60.0',
  license: 'MIT',
)

# Installation directories are relative to {prefix}.
# prefix      = get_option('prefix')
# bin_dir     = join_paths(prefix, get_option('bindir'))
# data_dir    = join_paths(prefix, get_option('datadir'))
# lib_dir     = join_paths(prefix, get_option('libdir'))
# locale_dir  = join_paths(prefix, get_option('localedir'))

include_dir   = include_directories('include')
config_h_dir  = meson.project_build_root()

# Generate config.h
git_hash = run_command('git', 'rev-parse', '--short', 'HEAD', check: true).stdout().strip()

config_h = configuration_data()
config_h.set_quoted('VERSION', meson.project_version())
config_h.set_quoted('GIT_COMMIT_HASH', git_hash)
# add more ...

configure_file(
  output: 'config.h',
  configuration: config_h,
)

################################################################################
# Dependencies
# - https://mesonbuild.com/Dependencies.html
# - https://mesonbuild.com/Reference-manual_functions.html#dependency

fmt           = dependency('fmt',           version: '>=11.2.0')
nlohmann_json = dependency('nlohmann_json', version: '>=3.7.3',  required: false)
# add more...

################################################################################
# Compiler flags

c_compiler    = meson.get_compiler('c')
cpp_compiler  = meson.get_compiler('cpp')

if cpp_compiler.get_id() == 'clang' and not cpp_compiler.version().version_compare('>=16.0.0')
  error('This project only supports gcc or clang >= 16 compilers due to usage of c++20 features.')
endif

common_flags = [
  '-Wno-unused-parameter',
  # '-Wno-unused-value',
  # '-Wunused-function',
  # '-Wno-narrowing',
  # '-Wno-missing-field-initializers',
  # '-Wno-unknown-warning-option', # only Clang
  '-Werror=vla',
  '-Werror=div-by-zero',
  '-I' + config_h_dir,
  '-I' + 'src/pch/cpp_pch.hpp', # https://github.com/mesonbuild/meson/issues/10590
]

extra_cflags = [
  '-Wmissing-prototypes',
  '-Wnested-externs',
  # '-Werror=restrict', # only GCC
]

extra_cxxflags = [
  '-Werror=uninitialized',
  # '-Werror=maybe-uninitialized', # only GCC
  '-Werror=missing-declarations',
  '-Werror=missing-field-initializers',
  '-Werror=address',
  '-Werror=pointer-arith',
  '-Werror=reorder',
  '-Werror=overflow',
  '-Werror=shift-overflow',
  '-Werror=multichar',
  '-Werror=write-strings',
  '-Werror=string-compare',
  # '-Werror=bool-compare', # only GCC
  '-Werror=bool-operation',
  '-Werror=conversion-null',
  '-Werror=float-conversion',
  '-Werror=deprecated-copy',
  '-Werror=deprecated-copy-dtor',
  '-Werror=mismatched-new-delete',
  # '-Werror=zero-length-bounds', # only GCC
  # '-Werror=invalid-memory-model', # only GCC
  # '-Werror=class-memaccess', # only GCC
]

cflags    = common_flags + extra_cflags
cxxflags  = common_flags + extra_cxxflags

add_project_arguments(
  c_compiler.get_supported_arguments(cflags),
  language: 'c'
)

add_project_arguments(
  cpp_compiler.get_supported_arguments(cxxflags),
  language: 'cpp'
)

# If mold <=1.10.1, may need add '-Wl,--no-as-needed', more details: https://github.com/rui314/mold/issues/1017
if get_option('enable-mold')
  link_args = ['-fuse-ld=mold', '-Wl,--no-as-needed']
else
  link_args = []
endif


################################################################################
# Subdirectories

subdir('src')

# Print status
message('\n'.join(['',
  '-----',
  meson.project_name() + ' ' + meson.project_version(),
  'Configuration:',
  '        Source code location:   @0@'.format(meson.project_source_root()),
  '        C Compiler:             @0@ @1@'.format(c_compiler.get_id(), c_compiler.version()),
  '        C++ Compiler:           @0@ @1@'.format(cpp_compiler.get_id(), cpp_compiler.version()),
  '        CFLAGS:                 @0@'.format(cflags),
  '        CXXFLAGS:               @0@'.format(cxxflags),
  # 'Directories:',
  # '        install_prefix:         @0@'.format(prefix),
  # '                binDir:         @0@'.format(bin_dir),
  # '                dataDir:        @0@'.format(data_dir),
  # '                libDir:         @0@'.format(lib_dir),
  # '-----',
]))
