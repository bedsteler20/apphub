from typing import TYPE_CHECKING

from gi.repository import Adw, Gio, Gtk

from apphub.api.types import FlathubApp
from apphub.utils.flatpak import FlatpakHelper
from apphub.utils.patterns import inject
from apphub.utils.transaction import InstallState, Transaction
from apphub.utils.transaction import check_install_state

if TYPE_CHECKING:
    from apphub.window import ApphubWindow


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/install_button.ui")
class InstallButton(Adw.Bin):
    __gtype_name__ = "InstallButton"

    install_button: Adw.SplitButton = Gtk.Template.Child()
    open_box: Gtk.Box = Gtk.Template.Child()
    uninstall_button: Gtk.Button = Gtk.Template.Child()
    open_button: Gtk.Button = Gtk.Template.Child()
    installing_label: Gtk.Label = Gtk.Template.Child()
    uninstalling_label: Gtk.Label = Gtk.Template.Child()

    flatpak: "FlatpakHelper" = inject("flatpak_helper")
    settings: "Gio.Settings" = inject("settings")
    window: "ApphubWindow" = inject("props.active_window")

    def __init__(self, app: FlathubApp):
        self.app = app
        super().__init__()
        # Connect buttons
        self.install_button.connect("clicked", self.on_install_btn_click)
        self.uninstall_button.connect("clicked", self.on_uninstall_btn_click)
        self.open_button.connect("clicked", self.on_open_btn_click)
        # Decide wether to show the install or open/uninstall button
        self.rebuild(check_install_state(self.app["id"]))

    def on_install_btn_click(self, *args):
        transaction = Transaction(
            action="install",
            installation=self.flatpak.get_preferred_installation(),
            remote=self.settings.get_string("flathub-remote-id"),
            app_id=self.app["id"],
            ref=self.app["bundle"]["value"],
        )
        transaction.connect("done", lambda *a: self.rebuild(InstallState.INSTALLED))
        transaction.connect(
            "error", lambda *a: self.rebuild(InstallState.NOT_INSTALLED)
        )
        self.rebuild(InstallState.INSTAlLING)
        transaction.run()

    def do_uninstall(self, widget, response):
        if response != "uninstall":
            return
        transaction = Transaction(
            action="uninstall",
            installation=self.flatpak.get_preferred_installation(),
            remote="flathub",
            app_id=self.app["id"],
            ref=self.app["bundle"]["value"],
        )
        transaction.connect("done", lambda *a: self.rebuild(InstallState.NOT_INSTALLED))
        transaction.connect("error", lambda *a: self.rebuild(InstallState.INSTALLED))
        self.rebuild(InstallState.UNINSTALLING)
        transaction.run()

    def on_uninstall_btn_click(self, *args):
        dialog = Adw.MessageDialog(
            body=f"Do you want to uninstall {self.app['name']}",
            transient_for=self.window,
        )
        dialog.add_response("uninstall", "Uninstall")
        dialog.add_response("cancel", "Cancel")
        dialog.set_response_appearance("uninstall", Adw.ResponseAppearance.DESTRUCTIVE)
        dialog.set_default_response("cancel")
        dialog.connect("response", self.do_uninstall)
        dialog.show()

    def on_open_btn_click(self, *args):
        self.flatpak.open_app(self.app["id"])

    def rebuild(self, state: str):
        if state == InstallState.UNINSTALLING:
            self.set_child(self.uninstalling_label)
        elif state == InstallState.INSTAlLING:
            self.set_child(self.installing_label)
        elif state == InstallState.INSTALLED:
            self.set_child(self.open_box)
        elif state == InstallState.NOT_INSTALLED:
            self.set_child(self.install_button)
