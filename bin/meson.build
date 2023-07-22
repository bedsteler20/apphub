
conf = configuration_data()
conf.set('PYTHON', python.find_installation('python3').path())
conf.set('VERSION', meson.project_version())
conf.set('localedir', join_paths(get_option('prefix'), get_option('localedir')))
conf.set('pkgdatadir', pkgdatadir)
conf.set('sourceroot', meson.source_root())
conf.set('build_type', get_option('buildtype'))

configure_file(
    input: 'apphub.in.py',
    output: 'apphub',
    configuration: conf,
    install: true,
    install_dir: get_option('bindir'),
)