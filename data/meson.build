install_data(
    #meson.project_name() + '-extras.gschema.xml',
    meson.project_name() + '.gschema.xml',
    install_dir: join_paths(get_option('prefix'), get_option('datadir'), 'glib-2.0', 'schemas')
)

#Install our .desktop file so the Applications Menu will see it
install_data(
    meson.project_name() + '.desktop',
    install_dir: join_paths(get_option('datadir'), 'applications')
)

#Install our .appdata.xml file so AppCenter will see it
install_data(
    meson.project_name() + '.appdata.xml',
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)
