import os

from gi.repository import Flatpak, GObject


class FlatpakHelper(GObject.Object):
    def __init__(self) -> None:
        super().__init__()
        self._pending_installs = []
        self._pending_uninstalls = []
        self.user_install = Flatpak.Installation.new_user()
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
        except:
            return False

    def open_app(self, app_id: str):
        os.system(f"flatpak-spawn --host flatpak run {app_id} &> /dev/null &")
