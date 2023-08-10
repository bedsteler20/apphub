from gi.repository import Adw, Gio, Gtk

import requests

from apphub.utils.flatpak import FlatpakHelper
from apphub.utils.gio_async import async_call
from apphub.utils.patterns import inject


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/settings_window.ui")
class SettingsWindow(Adw.PreferencesWindow):
    __gtype_name__ = "SettingsWindow"

    api_entry: Gtk.Entry = Gtk.Template.Child()
    remote_entry: Gtk.Entry = Gtk.Template.Child()

    flatpak: FlatpakHelper = inject("flatpak_helper")
    settings: Gio.Settings = inject("settings")

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.api_entry.set_text(
            self.settings.get_string("flathub-api")
            .replace("http://", "")
            .replace("https://", "")
        )
        self.remote_entry.set_text(self.settings.get_string("flathub-remote-id"))
        self.api_entry.connect("activate", self.validate_api_entry)
        self.remote_entry.connect("activate", self.validate_remote_entry)

    def validate_api_entry(self, *a):
        uri = self.api_entry.get_text().replace("http://", "").replace("https://", "")

        def on_done(res: "requests.Response", err):
            if err is None and res.status_code == 200:
                print("updated api to ", uri)
                self.settings.set_string("flathub-api", f"https://{uri}")
                self.api_entry.remove_css_class("error")
            else:
                self.api_entry.add_css_class("error")
                self.show_error(f"Error invalided flathub api: {uri}")

        async_call(requests.get, on_done, f"https://{uri}/status")

    def validate_remote_entry(self, *a):
        name = self.remote_entry.get_text()
        pref_install = self.flatpak.get_preferred_installation()
        for r in pref_install.list_remotes():
            if r.get_name() == name:
                print("Updated remote id to", name)
                self.settings.set_string("flathub-remote-id", name)
                self.remote_entry.remove_css_class("error")
                return
        self.remote_entry.add_css_class("error")
        self.show_error(f"Error remote {name} is not installed")

    def show_error(self, message):
        print(message)
        toast = Adw.Toast.new(message)
        toast.set_timeout(5)
        self.add_toast(toast)
