from gi.repository import GLib, Gtk


class navigator:
    """
    This is a utility class containing only static methods of
    calling the Gio Actions that control the router this is
    intended to be used throughout the application with only
    a gtk widget provided to trigger the actions
    """

    @staticmethod
    def visit(widget: Gtk.Widget, page: str):
        widget.activate_action("navigator.visit", GLib.Variant("s", page))

    @staticmethod
    def back(widget: Gtk.Widget):
        widget.activate_action("navigator.back", None)

    @staticmethod
    def push_state(widget: Gtk.Widget, page: str):
        widget.activate_action("navigator.push-state", GLib.Variant("s", page))

    @staticmethod
    def replace_state(widget: Gtk.Widget, page: str):
        widget.activate_action("navigator.replace-state", GLib.Variant("s", page))
