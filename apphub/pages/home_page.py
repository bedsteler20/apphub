from gi.repository import Gtk

from apphub.api.client import FlathubClient
from apphub.api.types import QueryInfo
from apphub.components.app_grid import AppGrid
from apphub.utils.navigator import navigator
from apphub.utils.router import AsyncRoute


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/home_page.ui")
class HomePage(Gtk.ScrolledWindow):
    __gtype_name__ = "HomePage"
    recently_added_grid: AppGrid = Gtk.Template.Child()
    popular_grid: AppGrid = Gtk.Template.Child()
    recently_updated_grid: AppGrid = Gtk.Template.Child()

    recently_added_btn: Gtk.Button = Gtk.Template.Child()
    popular_btn: Gtk.Button = Gtk.Template.Child()
    recently_updated_btn: Gtk.Button = Gtk.Template.Child()

    def __init__(
        self,
        *,
        recently_added: QueryInfo,
        popular_apps: QueryInfo,
        recently_updated: QueryInfo,
        **kwargs
    ):
        super().__init__(**kwargs)
        self.recently_added_grid.load_data(recently_added)
        self.popular_grid.load_data(popular_apps)
        self.recently_updated_grid.load_data(recently_updated)

        self.recently_added_btn.connect(
            "clicked",
            lambda *a: navigator.visit(self, "/apps/collection/recently-added/1"),
        )
        self.popular_btn.connect(
            "clicked", lambda *a: navigator.visit(self, "/apps/popular/last-month/1")
        )
        self.recently_updated_btn.connect(
            "clicked",
            lambda *a: navigator.visit(self, "/apps/collection/recently-updated/1"),
        )


class HomePageRoute(AsyncRoute):
    url = "/"

    def create(self, page_props, application, data):
        if not hasattr(self, "widget"):
            self.widget = HomePage(**data)
        return self.widget

    def load_data(self, page_props, application):
        if hasattr(self, "widget"):
            return {}
        return {
            "recently_added": FlathubClient.recently_added(1, 12),
            "popular_apps": FlathubClient.popular(1, 12),
            "recently_updated": FlathubClient.recently_updated(1, 12),
        }
