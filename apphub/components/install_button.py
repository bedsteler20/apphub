from typing import TYPE_CHECKING

from gi.repository import Adw, Gtk

from apphub.utils.flatpak import InstallState
from apphub.utils.locate import locate


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/install_button.ui")
class InstallButton(Adw.Bin):
    __gtype_name__ = "InstallButton"

    install_button: Adw.SplitButton = Gtk.Template.Child()
    open_box: Gtk.Box = Gtk.Template.Child()
    uninstall_button: Gtk.Button = Gtk.Template.Child()
    open_button: Gtk.Button = Gtk.Template.Child()

    def __init__(self, name: str, app_id: str):
        self.app_id = app_id
        self.app_name = name
        super().__init__()
        # Connect buttons
        self.install_button.connect("clicked", self.on_install_btn_click)
        self.uninstall_button.connect("clicked", self.on_uninstall_btn_click)
        self.open_button.connect("clicked", self.on_open_btn_click)
        # Decide wether to show the install or open/uninstall button
        flatpak = locate.flatpak()
        self.on_state_change(app_id, flatpak.get_state(app_id))

    def on_install_btn_click(self, *args):
        pass

    def on_uninstall_btn_click(self, *args):
        dialog = Adw.MessageDialog(
            body=f"Do you want to uninstall {self.app_name}",
            transient_for=locate.window(),
        )
        dialog.add_response("uninstall", "Uninstall")
        dialog.add_response("cancel", "Cancel")
        dialog.set_response_appearance("uninstall", Adw.ResponseAppearance.DESTRUCTIVE)
        dialog.set_default_response("cancel")
        dialog.show()

    def on_open_btn_click(self, *args):
        locate.flatpak().open_app(self.app_id)

    def on_state_change(self, app_id: str, state: InstallState):
        if app_id != self.app_id:
            return
        elif state == InstallState.INSTALLED:
            self.set_child(self.open_box)
        elif state == InstallState.NOT_INSTALLED:
            self.set_child(self.install_button)
