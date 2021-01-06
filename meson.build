# project name and programming language
project(
    'com.github.retsef.chess',
    'vala', 'c',
    version: '1.0.0'
)

if meson.get_compiler('vala').version().version_compare('<0.40')
    error('Missing required dependency: valac >= 0.40')
endif


# Include the translations module
i18n = import('i18n')
# Dependencies
gtk_dependency = dependency('gtk+-3.0')
granite_dependency = dependency('granite', version: '>= 5.3.0')
gee_dependency = dependency('gee-0.8')
gmodule_dependency = dependency('gmodule-2.0')
glib_dependency = dependency('glib-2.0')
gobject_dependency = dependency('gobject-2.0')

# Include the gnome module
gnome = import('gnome')
chess_resources = gnome.compile_resources(
    'chess_resources', 'data/' + meson.project_name() + '.gresource.xml',
    source_dir: 'data'
)

vala_lint = find_program('io.elementary.vala-lint', required : false)
if vala_lint.found()
    test (
        'Vala lint',
        vala_lint,
        args: ['-d', join_paths(meson.source_root(), 'src')]
    )
endif


subdir('data')
subdir('src')
