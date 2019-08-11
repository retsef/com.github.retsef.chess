# project name and programming language
project(
    'com.github.retsef.chess',
    'vala', 'c',
    version: '1.0.0'
)

if meson.get_compiler('vala').version().version_compare('<0.40')
    error('Missing required dependency: valac >= 0.40')
endif

gnome = import('gnome')
i18n = import('i18n')


chess_resources = gnome.compile_resources(
    'chess_resources', 'data/' + meson.project_name() + '.gresource.xml',
    source_dir: 'data'
)


subdir('data')
subdir('src')
