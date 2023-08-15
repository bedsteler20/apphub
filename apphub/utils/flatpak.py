import os

from apphub.utils.misc import read_desktop_file

# from gi.repository import Flatpak, Gio, GObject

# from apphub.utils.patterns import inject

# class FlatpakHelper(GObject.Object):
#     settings: Gio.Settings = inject("settings")

#     def __init__(self) -> None:
#         super().__init__()
#         self._pending_installs = []
#         self._pending_uninstalls = []
#         self.user_install = Flatpak.Installation.new_user()
#         self.system_install = Flatpak.Installation.new_system()

#     def get_preferred_installation(self):
#         name = self.settings.get_string("preferred-installation")
#         if name == "user":
#             return self.user_install
#         elif name == "system":
#             return self.system_install
#         else:
#             return None

#     def is_app_installed(
#         self, app_id: str, install: Flatpak.Installation = None
#     ) -> bool:
#         if install is None:
#             if self.is_app_installed(app_id, self.user_install):
#                 return True
#             elif self.is_app_installed(app_id, self.system_install):
#                 return True
#             else:
#                 return False
#         try:
#             install.get_current_installed_app(app_id)
#             return True
#         except:
#             return False

#     def open_app(self, app_id: str):
#         os.system(f"flatpak-spawn --host flatpak run {app_id} &> /dev/null &")


def get_installed_apps(install_path: str, remote_name="flathub", arch="x86_64"):
    icon_dir = os.path.join(
        install_path, "appstream", remote_name, arch, "active", "icons", "64x64"
    )
    app_dir = os.path.join(install_path, "exports", "share", "applications")
    apps = []
    for f in os.listdir(app_dir):
        if not f.endswith(".desktop"):
            continue
        app_id = os.path.basename(f).removesuffix(".desktop")
        icon = os.path.join(icon_dir, app_id + ".png")
        if not os.path.exists(icon):
            continue
        df = os.path.join(app_dir, f)
        with open(df, "r") as x:
            data = read_desktop_file(x)
        apps.append(
            {
                "name": data["Desktop Entry"]["Name"],
                "icon": icon,
                "id": app_id,
            }
        )
    return apps


get_installed_apps("/home/bedsteler20/.local/share/flatpak")
