from gi.repository import Adw, Gdk, GdkPixbuf, GLib, Gtk

import requests

from apphub.utils.gio_async import async_call


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


def load_image_batch(
    images: dict[str, Gtk.Picture | Gtk.Image | Adw.Avatar],
    width: int = None,
    height: int = None,
    square: bool = None,
    upscale: bool = None,
):
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
