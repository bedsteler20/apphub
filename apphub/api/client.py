from typing import TYPE_CHECKING

from gi.repository import Gio, GLib

import requests

from apphub.globals import settings

if TYPE_CHECKING:
    from apphub.api.types import FlathubApp, QueryInfo


class FlathubClient:
    _url = settings.get_string("flathub-api")

    @staticmethod
    def set_url(url):
        FlathubClient._url = url

    @staticmethod
    def _query(path: str, page: int | None = None, per_page: int | None = None):
        params = {}
        if per_page is not None:
            params["per_page"] = per_page
        if page is not None:
            params["page"] = page
        return requests.get(FlathubClient._url + path, params=params).json()

    def recently_added(page: int = 1, per_page: int = 50) -> "QueryInfo":
        return FlathubClient._query("/collection/recently-added", page, per_page)

    def recently_updated(page: int = 1, per_page: int = 0) -> "QueryInfo":
        return FlathubClient._query("/collection/recently-updated", page, per_page)

    def popular(page: int = 1, per_page: int = 50) -> "QueryInfo":
        return FlathubClient._query("/popular/last-month", page, per_page)

    def app_info(id: str) -> "FlathubApp":
        return FlathubClient._query(f"/appstream/{id}")

    def search(query: str) -> "QueryInfo":
        uri = FlathubClient._url + "/search"
        return requests.post(uri, json={"query": query}).json()
