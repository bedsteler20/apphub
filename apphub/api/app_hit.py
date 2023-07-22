from typing import TYPE_CHECKING
from gi.repository import GObject
if TYPE_CHECKING:
    from .types import AppHitJson


class AppHitListItem(GObject.GObject):
    name: str = GObject.Property(type=str, flags=GObject.ParamFlags.READABLE)
    icon: str = GObject.Property(type=str, flags=GObject.ParamFlags.READABLE)
    id: str = GObject.Property(type=str, flags=GObject.ParamFlags.READABLE)
    is_foss: bool = GObject.Property(
        type=bool, default=False, flags=GObject.ParamFlags.READABLE)
    is_verified: bool = GObject.Property(
        type=bool, default=False, flags=GObject.ParamFlags.READABLE)

    def __init__(self, data: "AppHitJson"):
        GObject.GObject.__init__(self)
        self.name = data['name']
        self.icon = data['icon']
        self.id = data['id']
        if data['verification_verified'] == 'true':
            self.is_verified = True
        if data['is_free_license']:
            self.is_foss = True
