from gi.repository import GObject, Gtk

from apphub.api.types import QueryInfo
from apphub.components.app_card import AppCard
from apphub.components.loading import LoadingWidget
from apphub.utils.image import load_image_batch


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/app_grid.ui")
class AppGrid(Gtk.Box):
    __gtype_name__ = "AppGrid"

    flow: Gtk.FlowBox = Gtk.Template.Child()
    rows: int = GObject.Property(
        type=int, default=4, minimum=1, maximum=69, flags=GObject.ParamFlags.READWRITE
    )
    columns: int = GObject.Property(
        type=int, default=3, minimum=1, maximum=69, flags=GObject.ParamFlags.READWRITE
    )
    cards: AppCard = []

    def __init__(self):
        super().__init__()
        self._flow = Gtk.FlowBox()

        self._flow.set_min_children_per_line(self.columns)
        self.append(self._flow)

        self.cards: list[AppCard] = []
        for y in range(self.columns):
            for x in range(self.rows):
                card = AppCard()
                self._flow.append(card)
                self.cards.append(card)

    def load_data(self, info: "QueryInfo"):
        batch = {}
        for i in range(len(self.cards)):
            self.cards[i].set_app(info["hits"][i], load_icon=False)
            batch[info["hits"][i]["icon"]] = self.cards[i].image
        load_image_batch(batch)
