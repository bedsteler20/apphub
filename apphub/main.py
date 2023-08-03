import os
import sys
from apphub.utils.flatpak import FlatpakHelper

from gi.repository import Gtk, Gio, Adw, Gdk, Flatpak
from apphub.pages.home_page import HomePageRoute
from apphub.utils.router import Router
from apphub.window import ApphubWindow


class ApphubApplication(Adw.Application):

    def __init__(self):
        super().__init__(application_id='com.bedsteler20.AppHub',
                         flags=Gio.ApplicationFlags.FLAGS_NONE)
        self.create_action('quit', self.quit, ['<primary>q'])
        self.create_action('about', self.on_about_action)
        self.create_action('preferences', self.on_preferences_action)
        self.create_action('open-browser', self.on_open_browser)
        self.flatpak_helper = FlatpakHelper()

    def _load_resource(self):
        display = Gdk.Display.get_display()
        icon_theme = Gtk.IconTheme.get_for_display(display)
        style_provider = Gtk.CssProvider()
        style_provider.load_from_resource("/com/bedsteler20/AppHub/styles.css")
        icon_theme.add_resource_path('/com/bedsteler20/AppHub/icons')
        Gtk.StyleContext.add_provider_for_display(display, style_provider,
                                                  Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

    def do_activate(self):
        win = self.props.active_window
        if not win:
            win = ApphubWindow(application=self)
        win.present()

    def on_open_browser(self, widget, _):
        uri: str = self.props.active_window.navigator.current_uri
        if uri.startswith("/search/"):
            q = uri.replace("/search/", "")
            uri = f"/apps/search?q{q}"
        os.system(f"xdg-open https://flathub.org{uri}")

    def on_about_action(self, widget, _):
        """Callback for the app.about action."""
        about = Adw.AboutWindow(transient_for=self.props.active_window,
                                modal=True,
                                application_name='apphub',
                                application_icon='com.bedsteler20.AppHub',
                                version='0.1.0',
                                developers=['bedsteler20'],
                                copyright='© 2023 bedsteler20')
        about.present()

    def on_preferences_action(self, widget, _):
        print('app.preferences action activated')

    def create_action(self, name, callback, shortcuts=None):
        action = Gio.SimpleAction.new(name, None)
        action.connect("activate", callback)
        self.add_action(action)
        if shortcuts:
            self.set_accels_for_action(f"app.{name}", shortcuts)


def main(version):
    global app
    app = ApphubApplication()
    return app.run(sys.argv)
