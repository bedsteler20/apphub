from gi.repository import Gtk

from apphub.api.types import AppHitJson
from apphub.utils.misc import xdg_open


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/app_links.ui")
class AppLinks(Gtk.FlowBox):
    __gtype_name__ = "AppLinks"

    install_size_card: Gtk.Box = Gtk.Template.Child()
    download_size_card: Gtk.Box = Gtk.Template.Child()
    arch_card: Gtk.Box = Gtk.Template.Child()
    installs_card: Gtk.Box = Gtk.Template.Child()
    license_card: Gtk.Box = Gtk.Template.Child()
    website_card: Gtk.Box = Gtk.Template.Child()
    issues_card: Gtk.Box = Gtk.Template.Child()
    contribute_card: Gtk.Box = Gtk.Template.Child()
    help_card: Gtk.Box = Gtk.Template.Child()
    translate_card: Gtk.Box = Gtk.Template.Child()
    donate_card: Gtk.Box = Gtk.Template.Child()
    manifest_card: Gtk.Box = Gtk.Template.Child()

    install_size_label: Gtk.Label = Gtk.Template.Child()
    download_size_label: Gtk.Label = Gtk.Template.Child()
    arch_label: Gtk.Label = Gtk.Template.Child()
    installs_label: Gtk.Label = Gtk.Template.Child()
    license_label: Gtk.Label = Gtk.Template.Child()
    website_label: Gtk.Label = Gtk.Template.Child()
    issues_label: Gtk.Label = Gtk.Template.Child()
    contribute_label: Gtk.Label = Gtk.Template.Child()
    help_label: Gtk.Label = Gtk.Template.Child()
    translate_label: Gtk.Label = Gtk.Template.Child()
    donate_label: Gtk.Label = Gtk.Template.Child()
    manifest_label: Gtk.Label = Gtk.Template.Child()

    @Gtk.Template.Callback()
    def on_website_clicked(self, widget):
        xdg_open(self.app["urls"]["homepage"])

    @Gtk.Template.Callback()
    def on_issues_clicked(self, widget):
        xdg_open(self.app["urls"]["bugtracker"])

    @Gtk.Template.Callback()
    def on_contribute_clicked(self, widget):
        xdg_open(self.app["urls"]["contribute"])

    @Gtk.Template.Callback()
    def on_help_clicked(self, widget):
        xdg_open(self.app["urls"]["help"])

    @Gtk.Template.Callback()
    def on_translate_clicked(self, widget):
        xdg_open(self.app["urls"]["translate"])

    @Gtk.Template.Callback()
    def on_donates_clicked(self, widget):
        xdg_open(self.app["urls"]["donation"])

    @Gtk.Template.Callback()
    def on_manifest_clicked(self, widget):
        xdg_open(f"https://github.com/flathub/{self.app['app_id']}")

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        self.install_size_card.add_css_class("card")
        self.download_size_card.add_css_class("card")
        self.arch_card.add_css_class("card")
        self.installs_card.add_css_class("card")
        self.license_card.add_css_class("card")
        self.website_card.add_css_class("card")
        self.issues_card.add_css_class("card")
        self.contribute_card.add_css_class("card")
        self.help_card.add_css_class("card")
        self.translate_card.add_css_class("card")
        self.donate_card.add_css_class("card")
        self.manifest_card.add_css_class("card")

    def build(self, app: AppHitJson):
        self.app = app
        if app.get("installed_size"):
            self.append(self.install_size_card)
            self.set_label(
                self.install_size_label, f"{app['installed_size'] / 1024 / 1024:.2f} MB"
            )

        if app.get("download_size"):
            self.append(self.download_size_card)
            self.set_label(
                self.download_size_label, f"{app['download_size'] / 1024 / 1024:.2f} MB"
            )
        if app.get("arches"):
            self.append(self.arch_card)
            self.set_label(
                self.arch_label,
                str(app["arches"]).replace("[", "").replace("'", "").replace("]", ""),
            )

        if app.get("installs_last_month"):
            self.append(self.installs_card)
            self.set_label(self.installs_label, str(app["installs_last_month"]))

        if app.get("project_license"):
            self.append(self.license_card)
            self.set_label(self.license_label, str(app["project_license"]))

        if app["urls"].get("homepage"):
            self.append(self.website_card)
            self.set_label(self.website_label, app["urls"]["homepage"])

        if app["urls"].get("bugtracker"):
            self.append(self.issues_card)
            self.set_label(self.issues_label, app["urls"]["bugtracker"])

        if app["urls"].get("contribute"):
            self.append(self.contribute_card)
            self.set_label(self.contribute_card, app["urls"]["contribute"])

        if app["urls"].get("help"):
            self.append(self.help_card)
            self.set_label(self.help_label, app["urls"]["help"])

        if app["urls"].get("translate"):
            self.append(self.translate_card)
            self.set_label(self.translate_label, app["urls"]["translate"])

        if app["urls"].get("donation"):
            self.append(self.donate_card)
            self.set_label(self.donate_label, app["urls"]["donation"])

        if app.get("app_id"):
            self.append(self.manifest_card)
            self.set_label(
                self.manifest_label, f"https://github.com/flathub/{self.app['app_id']}"
            )

    def set_label(self, widget, label):
        if len(label) > 40:
            label = label[0:37] + "..."
        widget.set_label(label)
