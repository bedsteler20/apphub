from enum import Enum
import json
import os
from gi.repository import Flatpak, Gio, GLib, GObject


class InstallState(Enum):
    INSTALLED = 0
    NOT_INSTALLED = 1
    DOWNLOADING = 2
    REMOVING = 3


class FlatpakHelper(GObject.Object):
    __gsignals__ = {
        'state_change': (GObject.SIGNAL_RUN_FIRST, None,
                         (str, int)),
    }

    def __init__(self) -> None:
        super().__init__()
        self._app_states: dict[str, int] = {}
        # Flatpak tries to find the user installation in xdg-data but because
        # our xdg-data dir is ~/.var/app/$APP_ID/data it wont be in there so we
        # have to manually add it by it standard location
        self.user_install = Flatpak.Installation.new_for_path(Gio.File.new_for_path(
            os.path.expanduser("~/.local/share/flatpak/")), True, None)
        self.system_install = Flatpak.Installation.new_system()

    def is_app_installed(self, app_id: str, install: Flatpak.Installation = None) -> bool:
        if install is None:
            return (self.is_app_installed(app_id, self.user_install) or
                    self.is_app_installed(app_id, self.system_install))
        try:
            install.get_current_installed_app(app_id)
            return True
        except GLib.Error:
            return False

    def open_app(self, app_id: str):
        os.system(f"flatpak-spawn --host flatpak run {app_id} &> /dev/null &")

    def get_state(self, app_id: str):
        if app_id in self._app_states.keys():
            return self._app_states[app_id]
        elif self.is_app_installed(app_id):
            return InstallState.INSTALLED
        else:
            return InstallState.NOT_INSTALLED

    def do_state_change(self, app_id: str, state: InstallState):
        # Remove existing state storage if its not being removed or added
        if state == InstallState.INSTALLED or state == InstallState.NOT_INSTALLED:
            del self._app_states[app_id]
