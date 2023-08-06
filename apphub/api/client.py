from typing import TYPE_CHECKING
from gi.repository import GLib
import requests

if TYPE_CHECKING:
    from apphub.api.types import FlathubApp, QueryInfo


class FlathubClient:
    _url = "https://flathub.org/api/v2"

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

    def recently_added(
        page: int | None = None, per_page: int | None = None
    ) -> "QueryInfo":
        return FlathubClient._query("/collection/recently-added", page, per_page)

    def recently_updated(
        page: int | None = None, per_page: int | None = None
    ) -> "QueryInfo":
        return FlathubClient._query("/collection/recently-updated", page, per_page)

    def popular(page: int | None = None, per_page: int | None = None) -> "QueryInfo":
        return FlathubClient._query("/popular/last-month", page, per_page)

    def app_info(id: str) -> "FlathubApp":
        return FlathubClient._query(f"/appstream/{id}")

    def download_ref(app_id: str):
        res = requests.get(f"https://dl.flathub.org/repo/appstream/{app_id}.flatpakref")
        return GLib.Bytes.new(res.content)
