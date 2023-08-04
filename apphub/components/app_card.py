from typing import TYPE_CHECKING

from gi.repository import GLib, Gtk

if TYPE_CHECKING:
    from apphub.api.types import AppHitJson

from apphub.utils.image import load_image
from apphub.utils.navigator import navigator


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/app_card.ui")
class AppCard(Gtk.Button):
    __gtype_name__ = "AppCard"

    image: Gtk.Image = Gtk.Template.Child()
    name_label: Gtk.Label = Gtk.Template.Child()
    description_label: Gtk.Label = Gtk.Template.Child()
    verified_label: Gtk.Label = Gtk.Template.Child()
    verified_box: Gtk.Box = Gtk.Template.Child()

    def do_clicked(self, *args) -> None:
        navigator.visit(self, f"/apps/{self._app_id}")

    def set_app(self, app: "AppHitJson", load_icon=True):
        self.name_label.set_label(app["name"])
        self._app_id = app["app_id"]

        if app.get("description"):
            self.description_label.set_label(app["summary"])

        if app.get("verification_verified") == "true":
            self.verified_box.set_visible(True)
            if app.get("verification_method") == "login_provider":
                if app.get("verification_login_provider") in ["gnome", "kde"]:
                    self.verified_label.set_label(
                        app["verification_login_provider"].upper()
                    )
                else:
                    self.verified_label.set_label(
                        f"@{app['verification_login_name']} on {app['verification_login_provider']}"
                    )
            elif app.get("verification_method") == "website":
                self.verified_label.set_label(app["verification_website"])
            else:
                self.verified_label.set_label("Verified")

        if load_icon:
            load_image(self.image, app["icon"])
