from typing import TYPE_CHECKING, TypeVar

from gi.repository import Adw, Gio, GLib, GObject

from routes import Mapper

from apphub.pages.error_page import ErrorPage
from apphub.pages.nav_page import NavPage
from apphub.utils.gio_async import async_call

T = TypeVar(
    "T",
)

if TYPE_CHECKING:
    from apphub.main import ApphubApplication


# Inspired by https://github.com/vixalien/muzika/blob/main/src/navigation.ts

# Maybe make this a independent glib library written in vala

# TODO: (Wait for Gnome 45) migrate to new libadw`s builtin navigator components


class Route:
    url: str

    def create(self, page_props: dict, application: "ApphubApplication"):
        pass


class AsyncRoute(Route):
    def load_data(self, page_props: dict, application: "ApphubApplication") -> T:
        """
        This method will be called before the create method is called.
        This will be running in a separate thread.The router will
        put itself into a loading state until this method completes
        the router will then call the create method passing this
        methods results to the create method as the parameter 'data'
        """
        pass

    def create(self, page_props: dict, application: "ApphubApplication", data: T):
        pass


class Router(GObject.GObject):
    is_loading: bool = GObject.Property(
        type=bool, default=False, flags=GObject.ParamFlags.READWRITE
    )

    def __init__(
        self, view: Adw.NavigationView, app: "ApphubApplication", routes: list[Route]
    ):
        GObject.GObject.__init__(self)
        self.application = app
        self._history = []
        self._mapper = Mapper()
        self._stack = view
        for route in routes:
            self._mapper.connect(route.url, route=route.url)
        self._routes = routes
        self._stack.connect("popped", self._on_pop)

    def _on_pop(self, view, page):
        if page is not None:
            self._history.pop()
            self.notify("can_go_back")
            self.notify("current_uri")

    def _endpoint(self, route: Route, page_props: dict):
        """
        This method handles rendering a route to the view if the route
        needs to load data asynchronously it fetches the data
        """
        page = NavPage()
        if issubclass(type(route), AsyncRoute):

            def on_done(result, error):
                self.is_loading = False
                page.loading = False
                if error is not None:
                    page.content = ErrorPage(error)
                    pass
                else:
                    page.content = route.create(page_props, self.application, result)

            self.is_loading = True
            page.loading = True
            async_call(route.load_data, on_done, page_props, self.application)
            pass
        else:
            page.content = route.create(page_props, self.application)
        self._stack.push(Adw.NavigationPage.new(page, ""))
        # self._stack.set_vi(w)

    def navigate(self, url: str):
        self.push_state(url)
        props = self._mapper.match(url)
        if props is None:
            self._load_404()
            return
        for route in self._routes:
            if route.url == props["route"]:
                self._endpoint(route, props)
                break

    def _load_404(self):
        page = NavPage()
        page.content = ErrorPage("404 Not Found")
        self._stack.push(Adw.NavigationPage.new(page, ""))

    def push_state(self, url: str):
        self._history.append(url)
        self.notify("can-go-back")
        self.notify("current-uri")

    def replace_state(self, url: str):
        self._history[len(self._history) - 1] = url
        self.notify("current-uri")

    def back(self):
        self._stack.pop()

    @GObject.Property(type=bool, default=False)
    def can_go_back(self):
        return len(self._history) > 1

    @GObject.Property(type=str)
    def current_uri(self):
        return self._history[len(self._history) - 1]

    def get_action_group(self):
        group = Gio.SimpleActionGroup()

        def visit(action: Gio.SimpleAction, params: GLib.Variant):
            if params is None:
                return
            url = params.get_string()
            if url is not None:
                self.navigate(url)

        def back(action: Gio.SimpleAction, params: GLib.Variant):
            self.back()

        def push_state(action: Gio.SimpleAction, params: GLib.Variant):
            if params is None:
                return
            self.push_state(params.get_string())

        def replace_state(action: Gio.SimpleAction, params: GLib.Variant):
            if params is None:
                return
            self.replace_state(params.get_string())

        def can_go_back(*args):
            group.action_enabled_changed("back", self.can_go_back)

        visit_action = Gio.SimpleAction(
            name="visit", parameter_type=GLib.VariantType("s")
        )
        visit_action.connect("activate", visit)
        group.add_action(visit_action)

        back_action = Gio.SimpleAction(name="back")
        back_action.connect("activate", back)
        group.add_action(back_action)

        push_action = Gio.SimpleAction(
            name="push-state", parameter_type=GLib.VariantType("s")
        )
        push_action.connect("activate", push_state)
        group.add_action(push_action)

        replace_action = Gio.SimpleAction(
            name="replace-state", parameter_type=GLib.VariantType("s")
        )
        replace_action.connect("activate", replace_state)
        group.add_action(replace_action)

        self.connect("notify::can-go-back", can_go_back)
        return group
