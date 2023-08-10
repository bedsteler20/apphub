import math

from gi.repository import Adw, Gtk

from apphub.api.client import FlathubClient
from apphub.api.types import QueryInfo
from apphub.components.app_grid import AppGrid
from apphub.components.pager_buttons import PagerButtons
from apphub.utils.patterns import inject
from apphub.utils.router import AsyncRoute


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/collection_page.ui")
class CollectionPage(Gtk.ScrolledWindow):
    __gtype_name__ = "CollectionPage"

    app_grid: AppGrid = Gtk.Template.Child()
    pager: PagerButtons = Gtk.Template.Child()

    def __init__(self, url: str, data: QueryInfo):
        super().__init__()
        self.app_grid.load_data(data)
        self.pager.build(data["page"], data["totalPages"])


class PopularPageRoute(AsyncRoute):
    url = "/apps/popular/last-month/{page}"
    api: FlathubClient = inject("flathub_client")

    def create(self, page_props: dict, application, data: QueryInfo):
        return CollectionPage("/apps/popular/last-month", data)

    def load_data(self, page_props: dict, application) -> QueryInfo:
        return self.api.popular(page_props.get("page"))


class RecentlyAddedPageRoute(AsyncRoute):
    url = "/apps/collection/recently-added/{page}"
    api: FlathubClient = inject("flathub_client")

    def create(self, page_props: dict, application, data: QueryInfo):
        return CollectionPage("/apps/collection/recently-added", data)

    def load_data(self, page_props: dict, application) -> QueryInfo:
        return self.api.recently_added(page_props.get("page"))


class RecentlyUpdatedPageRoute(AsyncRoute):
    url = "/apps/collection/recently-updated/{page}"
    api: FlathubClient = inject("flathub_client")

    def create(self, page_props: dict, application, data: QueryInfo):
        return CollectionPage("/apps/collection/recently-updated", data)

    def load_data(self, page_props: dict, application) -> QueryInfo:
        return self.api.recently_updated(page_props.get("page"))


class SearchPageRoute(AsyncRoute):
    url = "/search/{query}"
    api: FlathubClient = inject("flathub_client")

    def create(self, page_props: dict, application, data: QueryInfo):
        return CollectionPage("/apps/collection/recently-updated", data)

    def load_data(self, page_props: dict, application) -> QueryInfo:
        return self.api.search(page_props.get("query"))
