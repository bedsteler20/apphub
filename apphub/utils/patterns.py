from gi.repository import Gio


def inject(key: str):
    parts = key.split(".")

    def _get(self):
        x = Gio.Application.get_default()
        for p in parts:
            x = getattr(x, p)
        return x

    return property(_get)
