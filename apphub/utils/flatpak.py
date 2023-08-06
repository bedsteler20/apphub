import os
from enum import Enum

from gi.repository import Adw, Flatpak, Gio, GLib, GObject
from gi.repository.Flatpak import Installation, TransactionOperation
from gi.repository.Flatpak import TransactionResult
from apphub.api.client import FlathubClient
from apphub.api.types import AppHitJson, FlathubApp

from apphub.utils.locate import locate




class FlatpakHelper(GObject.Object):

    def __init__(self) -> None:
        super().__init__()
        self._pending_installs = []
        self._pending_uninstalls = []
        # Flatpak tries to find the user installation in xdg-data but because
        # our xdg-data dir is ~/.var/app/$APP_ID/data it wont be in there so we
        # have to manually add it by it standard location
        self.user_install = Flatpak.Installation.new_for_path(
            Gio.File.new_for_path(os.path.expanduser("~/.local/share/flatpak/")),
            True,
            None,
        )
        self.system_install = Flatpak.Installation.new_system()

    def is_app_installed(
        self, app_id: str, install: Flatpak.Installation = None
    ) -> bool:
        if install is None:
            if self.is_app_installed(app_id, self.user_install):
                return True
            elif self.is_app_installed(app_id, self.system_install):
                return True
            else:
                return False
        try:
            install.get_current_installed_app(app_id)
            return True
        except GLib.Error:
            return False

    def open_app(self, app_id: str):
        os.system(f"flatpak-spawn --host flatpak run {app_id} &> /dev/null &")
