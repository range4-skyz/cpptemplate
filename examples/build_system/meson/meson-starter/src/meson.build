globber = run_command('sh', '-c', 'find . -name "*.cpp" | sort', check: true)
src = globber.stdout().strip().split('\n')

vcs_dep = vcs_tag(
  command: ['git', 'rev-parse', '--short', 'HEAD'],
  input: 'version.h.in',
  output: 'version.h',
  replace_string: '@GIT_COMMIT_HASH@',
)

executable('meson_starter',
           src,
           vcs_dep,
           install: true)
