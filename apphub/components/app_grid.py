import math

from gi.repository import GObject, Gtk

from apphub.api.types import QueryInfo
from apphub.components.app_card import AppCard
from apphub.components.loading import LoadingWidget
from apphub.utils.image import load_image_batch


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/app_grid.ui")
class AppGrid(Gtk.Box):
    __gtype_name__ = "AppGrid"

    flow: Gtk.FlowBox = Gtk.Template.Child()
    columns: int = GObject.Property(
        type=int,
        default=3,
        minimum=1,
        maximum=69,  # haha funny number
        flags=GObject.ParamFlags.READWRITE,
    )

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.flow.set_min_children_per_line(self.columns)

    def load_data(self, info: "QueryInfo"):
        batch = {}
        for i in range(len(info["hits"])):
            card = AppCard()
            self.flow.append(card)
            card.set_app(info["hits"][i], load_icon=False)
            batch[info["hits"][i]["icon"]] = card.image
        load_image_batch(batch)
