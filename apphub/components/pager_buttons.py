from gi.repository import Gtk

from apphub.utils.navigator import navigator
from apphub.utils.patterns import inject


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/pager_buttons.ui")
class PagerButtons(Gtk.Box):
    __gtype_name__ = "PagerButtons"

    btn_l: Gtk.Button = Gtk.Template.Child()
    btn_f: Gtk.Button = Gtk.Template.Child()
    btn_1: Gtk.Button = Gtk.Template.Child()
    btn_2: Gtk.Button = Gtk.Template.Child()
    btn_3: Gtk.Button = Gtk.Template.Child()
    btn_4: Gtk.Button = Gtk.Template.Child()
    btn_5: Gtk.Button = Gtk.Template.Child()
    dots_l: Gtk.Label = Gtk.Template.Child()
    dots_f: Gtk.Label = Gtk.Template.Child()

    current_uri = inject("props.active_window.navigator.current_uri")

    def build(self, current_page, max_pages):
        current_page = int(current_page)
        max_pages = int(max_pages)
        self._current_page = current_page
        self._max_pages = max_pages

        self.btn_3.set_label(str(current_page))
        self.btn_l.set_label(str(max_pages))
        self.btn_f.set_label("1")
        i = current_page

        if current_page > 2:
            i -= 1
            self.btn_2.set_visible(True)
            self.btn_2.set_label(str(i))
        else:
            self.btn_2.set_visible(False)

        if current_page > 1:
            i -= 1
            self.btn_1.set_visible(True)
            self.btn_1.set_label(str(i))
        else:
            self.btn_1.set_visible(False)

        if current_page > 3:
            self.btn_f.set_visible(True)
        else:
            self.btn_f.set_visible(False)

        if current_page > 4:
            self.dots_f.set_visible(True)
        else:
            self.dots_f.set_visible(False)

        if max_pages >= current_page + 1:
            self.btn_4.set_label(str(current_page + 1))
            self.btn_4.set_visible(True)
        else:
            self.btn_4.set_visible(False)

        if max_pages >= current_page + 2:
            self.btn_5.set_label(str(current_page + 2))
            self.btn_5.set_visible(True)
        else:
            self.btn_5.set_visible(False)

        if max_pages >= current_page + 3:
            self.btn_l.set_visible(True)
        else:
            self.btn_l.set_visible(False)

        if max_pages >= current_page + 4:
            self.dots_l.set_visible(True)
        else:
            self.dots_l.set_visible(False)

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.btn_l.connect("clicked", self._on_click)
        self.btn_f.connect("clicked", self._on_click)
        self.btn_1.connect("clicked", self._on_click)
        self.btn_2.connect("clicked", self._on_click)
        self.btn_3.connect("clicked", self._on_click)
        self.btn_4.connect("clicked", self._on_click)
        self.btn_5.connect("clicked", self._on_click)

    def _on_click(self, btn: Gtk.Button):
        pg = int(btn.get_label())
        new_url: str = (
            self.current_uri.removesuffix(f"/{self._current_page}") + f"/{pg}"
        )
        navigator.visit(self, new_url)
