from gi.repository import Gtk, GObject


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/loading.ui")
class LoadingWidget(Gtk.Box):
    __gtype_name__ = 'LoadingWidget'
    loading: bool = GObject.Property(
        type=bool, default=False, flags=GObject.ParamFlags.READWRITE)
