gnome = import('gnome')

blueprints = custom_target('blueprints',
  input: files(
    'window.blp',
    'app_card.blp',
    'app_grid.blp',
    'app_page.blp',
    'error_page.blp',
    'home_page.blp',
    'loading.blp',
    'nav_page.blp',
    'screenshots_caracal.blp',
    'window.blp',
    'install_button.blp',
    'collection_page.blp',
    'settings_window.blp',
    'pager_buttons.blp',
    'app_links.blp',
  ),
  output: '.',
  command: [find_program('blueprint-compiler'), 'batch-compile', '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
)

gnome.compile_resources('apphub',
  'gresource.xml',
  gresource_bundle: true,
  install: true,
  install_dir: pkgdatadir,
  dependencies: blueprints,
)
