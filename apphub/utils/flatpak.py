import json
import os
from gi.repository import Flatpak, Gio, GLib, GObject


class FlatpakHelper(GObject.Object):
    def __init__(self) -> None:
        super().__init__()
        # Flatpak tries to find the user installation in xdg-data but because
        # our xdg-data dir is ~/.var/app/$APP_ID/data it wont be in there so we
        # have to manually add it by it standard location
        self.installation = Flatpak.Installation.new_for_path(Gio.File.new_for_path(
            os.path.expanduser("~/.local/share/flatpak/")), True, None)

    def is_app_installed(self, app_id: str) -> bool:
        try:
            self.installation.get_current_installed_app(app_id)
            return True
        except GLib.Error:
            return False
        
    def open_app(self, app_id: str):
        self.installation.launch(app_id)

    @staticmethod
    def find() -> "FlatpakHelper":
        import apphub
        return apphub.main.app.flatpak_helper
