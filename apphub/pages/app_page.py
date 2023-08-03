from apphub.components.install_button import InstallButton
from gi.repository import Adw, Gtk, GObject, Flatpak
from apphub.api.client import FlathubClient
from apphub.api.types import FlathubApp

from apphub.components.screenshots_caracal import ScreenshotCaracal
from apphub.utils.image import load_image
from apphub.utils.router import AsyncRoute
from apphub.utils.locate import locate


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/app_page.ui")
class AppPage(Adw.Bin):
    __gtype_name__ = "AppPage"

    icon: Gtk.Image = Gtk.Template.Child()
    name_label: Gtk.Label = Gtk.Template.Child()
    dev_label: Gtk.Label = Gtk.Template.Child()
    description_label: Gtk.Label = Gtk.Template.Child()
    summery_label: Gtk.Label = Gtk.Template.Child()
    caracal: ScreenshotCaracal = Gtk.Template.Child()
    install_box: Gtk.Box = Gtk.Template.Child()

    def __init__(self, app: FlathubApp):
        super().__init__()
        self.install_button = InstallButton(app["name"], app["id"])
        self.install_box.append(self.install_button)

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


class AppPageRoute(AsyncRoute):
    url = "/app/{app_id}"

    def create(self, page_props: dict, application, data: FlathubApp):
        return AppPage(app=data)

    def load_data(self, page_props: dict, application) -> FlathubApp:
        return FlathubClient.app_info(page_props["app_id"])
