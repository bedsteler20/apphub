install_data([
    'main.py',
    '__init__.py',
    'window.py'
], install_dir: moduledir)

install_data([
  'api/app_hit.py',
  'api/types.py',
  'api/client.py',
], install_dir: moduledir/'api')

install_data([
  'utils/gio_async.py',
  'utils/navigator.py',
  'utils/image.py',
  'utils/router.py',
  'utils/flatpak.py',
  'utils/transaction.py',
  'utils/locate.py',
], install_dir: moduledir/'utils')

install_data([
  'components/loading.py',
  'components/app_card.py',
  'components/app_grid.py',
  'components/screenshots_caracal.py',
  'components/install_button.py',
], install_dir: moduledir/'components')

install_data([
  'pages/error_page.py',
  'pages/home_page.py',
  'pages/nav_page.py',
  'pages/app_page.py'
], install_dir: moduledir/'pages')

subdir('ui')