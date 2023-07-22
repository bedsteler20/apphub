from typing import TypeVar
from routes import Mapper
from gi.repository import GObject, Adw, Gio, GLib
from apphub.pages.error_page import ErrorPage
from apphub.pages.nav_page import NavPage
from apphub.utils.gio_async import async_call
T = TypeVar('T',)


# Inspired by https://github.com/vixalien/muzika/blob/main/src/navigation.ts

class Route():
    url: str

    def create(self, page_props: dict):
        pass


class AsyncRoute(Route):
    def load_data(self, page_props: dict) -> T:
        """
        This method will be called before the create method is called.
        This will be running in a separate thread.The router will
        put itself into a loading state until this method completes
        the router will then call the create method passing this
        methods results to the create method as the parameter 'data'
        """
        pass

    def create(self, page_props: dict, data: T):
        pass


class Router(GObject.GObject):
    is_loading: bool = GObject.Property(
        type=bool, default=False, flags=GObject.ParamFlags.READWRITE)

    _history: list[str]
    _future: list[str]

    def __init__(self, view: Adw.ViewStack, routes: list[Route]):
        GObject.GObject.__init__(self)
        self._future = []
        self._history = []
        self._mapper = Mapper()
        self._stack = view
        for route in routes:
            self._mapper.connect(route.url, route=route.url)
        self._routes = routes
        pass

    def _endpoint(self, route: Route, page_props: dict, history: bool):
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
                    page.content = route.create(page_props, result)
            self.is_loading = True
            page.loading = True
            async_call(route.load_data, on_done, page_props)
            pass
        else:
            page.set_properties("content", route.create(page_props))
        self._stack.add(page)
        self._stack.set_visible_child(page)

    def navigate(self, url: str, history=True):
        if history and len(self._history) == 0 or url != self._history[len(self._history) - 1]:
            self.push_state(url)
            if self._stack.get_last_child() is not None:
                self._stack.remove(self._stack.get_last_child())
        props = self._mapper.match(url)
        if props is None:
            self._load_404()
            return
        for route in self._routes:
            if route.url == props["route"]:
                self._endpoint(route, props, history)
                break

    def _load_404(self):
        page = NavPage()
        page.content = ErrorPage("404 Not Found")
        self._stack.add(page)
        self._stack.set_visible_child(page)

    def push_state(self, url: str):
        self._history.append(url)
        self.notify('can-go-back')
        self.notify('current-uri')

    def replace_state(self, url: str):
        self._history[len(self._history) - 1] = url
        self.notify('current-uri')

    def go(self, n: int, navigate: bool = True):
        if n > 0:
            self._history.extend(self._future[-n:])
            del self._future[-n:]
        elif n < 0:
            self._future.extend(self._history[n:])
            del self._history[n:]

        self.notify("can_go_back")
        self.notify("can_go_forward")
        self.notify("current_uri")

        state = self._history[-1]

        if not state:
            state = '/'

        if navigate:
            self.navigate(state, True)

    def back(self, navigate=True):
        page = self._stack.get_visible_child()
        self.go(-1, navigate)
        self._stack.remove(page)

    def forward(self, navigate=False):
        self.go(1, navigate)

    def reload(self, navigate=False):
        self.go(0, navigate)

    @GObject.Property(type=bool, default=False)
    def can_go_back(self):
        return len(self._history) > 1

    @GObject.Property(type=bool, default=False)
    def can_go_forward(self):
        return len(self._history) > 0

    @GObject.Property(type=str)
    def current_uri(self):
        return self._history[len(self._history) - 1]

    can_go_forward: bool
    can_go_back: bool
    current_uri: str

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
            name="visit", parameter_type=GLib.VariantType("s"))
        visit_action.connect("activate", visit)
        group.add_action(visit_action)

        back_action = Gio.SimpleAction(name="back")
        back_action.connect("activate", back)
        group.add_action(back_action)

        push_action = Gio.SimpleAction(
            name="push-state", parameter_type=GLib.VariantType("s"))
        push_action.connect("activate", push_state)
        group.add_action(push_action)

        replace_action = Gio.SimpleAction(
            name="replace-state", parameter_type=GLib.VariantType("s"))
        replace_action.connect("activate", replace_state)
        group.add_action(replace_action)

        self.connect("notify::can-go-back", can_go_back)
        return group
