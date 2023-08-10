from gi.repository import Adw, Flatpak, GObject, Gtk

from apphub.api.client import FlathubClient
from apphub.api.types import FlathubApp
from apphub.components.install_button import InstallButton
from apphub.components.screenshots_caracal import ScreenshotCaracal
from apphub.utils.image import get_largest_size_string, load_image
from apphub.utils.patterns import inject
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
    install_box: Gtk.Box = Gtk.Template.Child()

    def __init__(self, app: FlathubApp):
        super().__init__()
        self.install_button = InstallButton(app)
        self.install_box.append(self.install_button)

        # Load app info
        load_image(self.icon, app["icon"])
        self.name_label.set_label(app["name"])
        if app.get("developer_name"):
            self.dev_label.set_label(f"By {app['developer_name']}")
        else:
            self.dev_label.set_visible(False)
        self.summery_label.set_label(app["summary"] if app.get("summary") else "")
        self.description_label.set_use_markup(True)
        # TODO: Extract this to a helper function
        description = (
            app.get("description", "")
            .replace("<p>", "")
            .replace("</p>", "\n\n")
            .replace("<ul>", "\n")
            .replace("</ul>", "")
            .replace("<li>", " • ")
            .replace("</li>", "\n")
        )
        self.description_label.set_markup(description)

        screenshots = []
        for s in app["screenshots"]:
            if s.get("sizes"):
                size = get_largest_size_string(s["sizes"].keys(), 1248 * 702, 0)
                screenshots.append(s["sizes"][size])
        if not screenshots:
            self.caracal.set_visible(False)
        else:
            self.caracal.load(screenshots)


class AppPageRoute(AsyncRoute):
    url = "/apps/{app_id}"
    api: FlathubClient = inject("flathub_client")

    def create(self, page_props: dict, application, data: FlathubApp):
        return AppPage(app=data)

    def load_data(self, page_props: dict, application) -> FlathubApp:
        return self.api.app_info(page_props["app_id"])
