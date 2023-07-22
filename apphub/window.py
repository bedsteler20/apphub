from gi.repository import Gtk, Adw, GObject

from apphub.api.client import FlathubClient
from apphub.components.loading import LoadingWidget
from apphub.pages.app_page import AppPageRoute
from apphub.pages.home_page import HomePageRoute
from apphub.utils.router import Router


@Gtk.Template(resource_path='/com/bedsteler20/AppHub/window.ui')
class ApphubWindow(Adw.ApplicationWindow):
    __gtype_name__ = 'ApphubWindow'

    view_stack: Adw.ViewStack = Gtk.Template.Child()
    back_btn: Gtk.Button = Gtk.Template.Child()

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.navigator = Router(self.view_stack, [
            HomePageRoute(),
            AppPageRoute(),
        ])
        self.navigator.navigate("/")
        self.insert_action_group(
            "navigator", self.navigator.get_action_group())
        self.navigator.bind_property(
            "can_go_back", self.back_btn, "visible",
            GObject.BindingFlags.DEFAULT
        )
