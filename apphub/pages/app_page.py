from apphub.utils.flatpak import FlatpakHelper
from gi.repository import Adw, Gtk, GObject, Flatpak
from apphub.api.client import FlathubClient
from apphub.api.types import FlathubApp

from apphub.components.screenshots_caracal import ScreenshotCaracal
from apphub.utils.image import load_image
from apphub.utils.router import AsyncRoute


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/app_page.ui")
class AppPage(Adw.Bin):
    __gtype_name__ = "AppPage"

    icon: Gtk.Image = Gtk.Template.Child()
    name_label: Gtk.Label = Gtk.Template.Child()
    dev_label: Gtk.Label = Gtk.Template.Child()
    description_label: Gtk.Label = Gtk.Template.Child()
    summery_label: Gtk.Label = Gtk.Template.Child()
    caracal: ScreenshotCaracal = Gtk.Template.Child()
    install_button: Adw.SplitButton = Gtk.Template.Child()

    open_box: Gtk.Box = Gtk.Template.Child()
    uninstall_button: Gtk.Button = Gtk.Template.Child()
    open_button: Gtk.Button = Gtk.Template.Child()

    def __init__(self, app: FlathubApp):
        super().__init__()
        self.app_info = app

        # Connect buttons
        self.install_button.connect("clicked", self.on_install_btn_click)
        self.uninstall_button.connect("clicked", self.on_uninstall_btn_click)
        self.open_button.connect("clicked", self.on_open_btn_click)
        # Decide wether to show the install or open/uninstall button
        self.is_installed = FlatpakHelper.find().is_app_installed(app["id"])
        self.install_button.set_visible(not self.is_installed)
        self.open_box.set_visible(self.is_installed)

        # Load app info
        load_image(self.icon, app["icon"])
        self.name_label.set_label(app['name'])
        self.dev_label.set_label(f"By {app['developer_name']}" if app.get(
            'developer_name') else "Unknown")
        self.summery_label.set_label(
            app['summary'] if app.get('summary') else "")
        self.description_label.set_use_markup(True)
        # TODO: Extract this to a helper function
        description = app.get('description', "").replace("<p>", "").replace(
            "</p>", "\n\n").replace("<ul>", "\n").replace("</ul>", "").replace("<li>", " • ").replace("</li>", "\n")
        self.description_label.set_markup(description)

        screenshots = []
        for s in app["screenshots"]:
            if s.get("sizes") and s["sizes"].get("1248x702"):
                screenshots.append(s["sizes"]["1248x702"])
        if not screenshots:
            self.caracal.set_visible(False)
        else:
            self.caracal.load(screenshots)

    def on_install_btn_click(self, *args):
        pass

    def on_uninstall_btn_click(self, *args):
        pass

    def on_open_btn_click(self, *args):
        FlatpakHelper.find().open_app(self.app_info["id"])


class AppPageRoute(AsyncRoute):
    url = "/app/{app_id}"

    def create(self, page_props: dict, application, data: FlathubApp):
        return AppPage(app=data)

    def load_data(self, page_props: dict, application) -> FlathubApp:
        return FlathubClient.app_info(page_props["app_id"])
