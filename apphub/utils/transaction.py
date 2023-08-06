import json
import os
from typing import Literal
from gi.repository import GObject, Gio, GLib, Flatpak

from apphub.utils.locate import locate

HELPER_EXECUTABLE = "/app/bin/transaction-helper"
global transactions
transactions = []


class InstallState:
    INSTALLED = "installed"
    NOT_INSTALLED = "not-installed"
    INSTAlLING = "installing"
    UNINSTALLING = "uninstalling"


class Transaction(GObject.Object):
    __gtype_name__ = "Transaction"
    __gsignals__ = {
        "error": (GObject.SIGNAL_RUN_FIRST, None, (str, int)),
        "done": (GObject.SIGNAL_RUN_FIRST, None, ()),
    }

    def __init__(
        self,
        action: Literal["install", "uninstall"],
        installation: Flatpak.Installation,
        remote: str,
        app_id: str,
        ref: str,
    ):
        super().__init__()
        self.action = action
        self.app_id = app_id
        self._exec = [
            HELPER_EXECUTABLE,
            action,
            f"--installation={installation.get_path().get_path()}",
            f"--user={installation.get_is_user()}",
            f"--remote={remote}",
            ref,
        ]

    def run(self):
        if self in transactions:
            return
        transactions.append(self)
        pid, id_in, id_out, id_err = GLib.spawn_async(
            self._exec,
            flags=GLib.SPAWN_DO_NOT_REAP_CHILD,
            standard_output=True,
            standard_error=True,
        )
        self._f_out = os.fdopen(id_out, "r")
        self._f_err = os.fdopen(id_err, "r")

        GLib.child_watch_add(pid, self._on_done)
        GLib.io_add_watch(self._f_out, GLib.IO_IN, self._on_stdout)
        GLib.io_add_watch(self._f_err, GLib.IO_ERR, print)

    def _on_stdout(self, foj, cond):
        dat = foj.readline()
        try:
            js = json.loads(dat)
            if js["type"] == "error":
                self.emit("error", js["message"], 1)
            elif js["type"] == "done":
                self.emit("done")
        except:
            pass

    def _on_done(self, pid, retval, *argv):
        transactions.remove(self)


def check_install_state(app_id) -> InstallState:
    for transaction in transactions:
        if transaction.app_id == app_id:
            if transaction.action == "install":
                return InstallState.INSTAlLING
            elif transaction.action == "uninstall":
                return InstallState.UNINSTALLING
            break
    if locate.flatpak().is_app_installed(app_id):
        return InstallState.INSTALLED
    else:
        return InstallState.NOT_INSTALLED
