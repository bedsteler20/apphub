import math
from typing import TYPE_CHECKING

from gi.repository import Gio, GLib

import requests

from apphub.utils.patterns import inject

if TYPE_CHECKING:
    from apphub.api.types import FlathubApp, QueryInfo


class FlathubClient:
    settings: Gio.Settings = inject("settings")

    def _query(self, path: str, page: int | None = None, per_page: int | None = None):
        params = {}
        if per_page is not None:
            params["per_page"] = per_page
        if page is not None:
            params["page"] = page
        return requests.get(
            self.settings.get_string("flathub-api") + path, params=params
        ).json()

    def recently_added(self, page: int = 1, per_page: int = 50) -> "QueryInfo":
        return self._query("/collection/recently-added", page, per_page)

    def recently_updated(self, page: int = 1, per_page: int = 0) -> "QueryInfo":
        return self._query("/collection/recently-updated", page, per_page)

    def popular(self, page: int = 1, per_page: int = 50) -> "QueryInfo":
        return self._query("/popular/last-month", page, per_page)

    def app_info(self, id: str) -> "FlathubApp":
        app = self._query(f"/appstream/{id}")
        app.update(self._query(f"/summary/{id}"))
        return app

    def search(self, query: str) -> "QueryInfo":
        uri = self.settings.get_string("flathub-api") + "/search"
        # Search dose not split into pages on the server so
        # it has to be done client side
        dat: "QueryInfo" = requests.post(
            uri,
            json={"query": query},
        ).json()
        dat["totalHits"] = len(dat["hits"])
        dat["totalPages"] = 1
        dat["page"] = 1
        dat["hitsPerPage"] = dat["totalHits"]

        return dat
