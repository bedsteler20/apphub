from gi.repository import Gtk, Adw, Gio


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/settings_window.ui")
class SettingsWindow(Adw.PreferencesWindow):
    __gtype_name__ = "SettingsWindow"

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
