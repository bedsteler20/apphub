import os
from gi.repository import Adw, Gdk, GdkPixbuf, GLib, Gtk

import requests

from apphub.utils.gio_async import async_call
from apphub.utils.locate import locate


def load_image(
    image: Gtk.Picture | Gtk.Image | Adw.Avatar,
    href: str,
    width: int = None,
    height: int = None,
    square: bool = None,
    upscale: bool = None,
):
    def asy():
        res = requests.get(href)
        return res.content

    def on_done(res, err):
        if res is not None:
            loader = GdkPixbuf.PixbufLoader()
            loader.write_bytes(GLib.Bytes.new(res))
            loader.close()
            pixelbuf = loader.get_pixbuf()
            if width is not None and height is not None:
                pixelbuf = pixelbuf.scale_simple(
                    width, height, GdkPixbuf.InterpType.HYPER
                )
            load_pixbuf(image, pixelbuf)

    async_call(asy, on_done)


def load_cache_icon(url: str):
    if url.startswith("https://dl.flathub.org/repo/appstream/x86_64/icons/128x128/"):
        f = url.replace(
            "https://dl.flathub.org/repo/appstream/x86_64/icons/128x128/", ""
        )
        flatpak_dir = locate.flatpak().user_install.get_path().get_path()
        fi = os.path.join(
            flatpak_dir, "appstream/flathub/x86_64/active/icons/128x128", f
        )
        if os.path.exists(fi):
            return GdkPixbuf.Pixbuf.new_from_file(fi)
    return None


def load_image_batch(
    images: dict[str, Gtk.Picture | Gtk.Image | Adw.Avatar],
    width: int = None,
    height: int = None,
    square: bool = None,
    upscale: bool = None,
    group_size: int = 12,
):
    for k in list(images.keys()):
        cached = load_cache_icon(k)
        if cached is not None:
            load_pixbuf(images[k], cached)
            del images[k]
    next_group = None
    if len(images) > group_size:
        next_group = dict(list(images.items())[group_size:])
        images = dict(list(images.items())[:group_size])
    keys = images.keys()

    def asy():
        data = {}
        for k in keys:
            data[k] = requests.get(k).content
        return data

    def on_done(res, err):
        if res is not None:
            for k in keys:
                loader = GdkPixbuf.PixbufLoader()
                loader.write_bytes(GLib.Bytes.new(res[k]))
                loader.close()
                pixelbuf = loader.get_pixbuf()
                if width is not None and height is not None:
                    pixelbuf = pixelbuf.scale_simple(
                        width, height, GdkPixbuf.InterpType.HYPER
                    )
                load_pixbuf(images[k], pixelbuf)
                del pixelbuf
        if next_group is not None:
            load_image_batch(next_group, width, height, square, upscale, group_size)

    async_call(asy, on_done)


def load_pixbuf(image: Gtk.Image | Gtk.Picture | Adw.Avatar, pixbuf: GdkPixbuf.Pixbuf):
    if isinstance(image, Gtk.Picture):
        image.set_pixbuf(pixbuf)
    elif isinstance(image, Gtk.Image):
        image.set_from_pixbuf(pixbuf)
    elif isinstance(image, Adw.Avatar):
        texture = Gdk.Texture.new_for_pixbuf(pixbuf)
        image.set_custom_image(texture)


def get_largest_size_string(sizes: list[str], max=99999, min=0):
    """
    Takes a list of strings that are formatted as
    1920x1080 or 102x1024 and returns the largest
    size string
    """
    biggest_str, biggest_n = None, min
    for s in sizes:
        split = s.split("x", 1)
        num = int(split[0]) * int(split[1])
        if num > biggest_n and num < max:
            biggest_n = num
            biggest_str = s
    return biggest_str
