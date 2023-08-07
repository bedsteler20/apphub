from gi.repository import Adw, Gtk


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/error_page.ui")
class ErrorPage(Gtk.Box):
    __gtype_name__ = "ErrorPage"

    more = Gtk.Template.Child()
    status = Gtk.Template.Child()
    text_view = Gtk.Template.Child()

    def __init__(self, error):
        super().__init__()

        self.status = Adw.StatusPage()
        self.more = Gtk.Box()
        self.text_view = Gtk.TextView()
        self.buffer = self.text_view.get_buffer()

        if error is not None:
            self.set_error(error)

    def set_message(self, message):
        self.status.set_description(message)

    def set_more(self, show, label=None):
        self.more.set_visible(show)
        if label:
            self.buffer.set_text("")
            n = "\n$"
            self.buffer.insert_markup(
                self.buffer.get_start_iter(), f'<tt>{label.replace(n, "")}</tt>', -1
            )

    def set_error(self, error):
        if isinstance(error, Exception):
            self.set_message(error.args[0])
            self.set_more(True, str(error))
        else:
            self.set_message(f"Error: {error}" if error else "Unknown error")
            self.set_more(False)
