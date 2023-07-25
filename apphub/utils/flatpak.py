import json
import os
from gi.repository import Flatpak, Gio, GLib


def get_installed_apps(install: Flatpak.Installation) -> list[str]:
    ids = []
    for dir in os.listdir(install.get_path().get_path() + "/app"):
        ids.append(dir)
    return ids


def get_flatpak_user_install() -> Flatpak.Installation:
    return Flatpak.Installation.new_for_path(Gio.File.new_for_path(os.path.expanduser("~/.local/share/flatpak/")), True, None)


def get_flatpak_system_install() -> Flatpak.Installation:
    return Flatpak.Installation.new_for_path(Gio.File.new_for_path("/var/lib/flatpak"), False, None)


def is_app_installed(app_id: str, install: Flatpak.Installation) -> bool:
    try:
        install.get_current_installed_app(app_id)
        return True
    except GLib.Error as e:
        return False


print(is_app_installed("com.valvesoftware.Steam", get_flatpak_user_install()))
