from gi.repository import Adw, GObject, Gtk

from apphub.api.client import FlathubClient
from apphub.components.loading import LoadingWidget
from apphub.pages.app_page import AppPageRoute
from apphub.pages.collection_page import PopularPageRoute
from apphub.pages.collection_page import RecentlyAddedPageRoute
from apphub.pages.collection_page import RecentlyUpdatedPageRoute
from apphub.pages.collection_page import SearchPageRoute
from apphub.pages.home_page import HomePageRoute
from apphub.utils.router import Router


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/window.ui")
class ApphubWindow(Adw.ApplicationWindow):
    __gtype_name__ = "ApphubWindow"

    view_stack: Adw.NavigationView = Gtk.Template.Child()
    back_btn: Gtk.Button = Gtk.Template.Child()
    search_bar: Gtk.SearchBar = Gtk.Template.Child()

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.navigator = Router(
            self.view_stack,
            self.props.application,
            [
                HomePageRoute(),
                AppPageRoute(),
                PopularPageRoute(),
                RecentlyAddedPageRoute(),
                RecentlyUpdatedPageRoute(),
                SearchPageRoute(),
            ],
        )
        self.navigator.navigate("/")
        self.insert_action_group("navigator", self.navigator.get_action_group())
        self.navigator.bind_property(
            "can_go_back", self.back_btn, "visible", GObject.BindingFlags.DEFAULT
        )
        self.search_bar.connect("activate", self.on_search)

    def on_search(self, *a):
        if self.navigator.current_uri.startswith("/search"):
            self.view_stack.pop()
        self.navigator.navigate(f"/search/{self.search_bar.get_text()}")
