from gi.repository import Gtk, Adw, GObject

from apphub.components.loading import LoadingWidget


# Adw.ViewStackPage is a final class and thus cant be extended
# so we need to build it manually without a blueprint definition :(
class NavPage(Gtk.Stack):
    __gtype_name__ = 'NavPage'

    def __init__(self):
        super().__init__()
        self._loading_widget = LoadingWidget()
        self._content_widget = Adw.Bin()

        self.add_named(self._content_widget, "content")
        self.add_named(self._loading_widget, "loading")

    @GObject.Property(type=bool, default=False)
    def loading(self):
        return self.get_visible_child() == self._loading_widget

    @loading.setter
    def loading(self, loading):
        self.set_visible_child(
            self._loading_widget if loading else self._content_widget)

    @GObject.Property(type=Gtk.Widget)
    def content(self):
        return self._content_widget.get_child()

    @content.setter
    def content(self, content):
        if content:
            self._content_widget.set_child(content)
            self.loading = False
        else:
            self.loading = True
