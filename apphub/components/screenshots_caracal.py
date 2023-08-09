import os

from gi.repository import Adw, Gio, Gtk

from apphub.utils.image import load_image_batch


@Gtk.Template(resource_path="/com/bedsteler20/AppHub/screenshots_caracal.ui")
class ScreenshotCaracal(Adw.Bin):
    __gtype_name__ = "ScreenshotCaracal"
    carousel: Adw.Carousel = Gtk.Template.Child()
    content: Gtk.Box = Gtk.Template.Child()

    def load(self, images: list[str]):
        batch = {}
        for url in images:
            img = Gtk.Picture(
                content_fit=Gtk.ContentFit.FILL,
                css_classes=["rounded-image"],
            )
            batch[url] = img
            img.set_margin_bottom(15)
            img.set_margin_top(15)
            self.carousel.append(img)
        load_image_batch(
            batch,
            height=702,
            width=1248,
            square=False,
            upscale=True,
            group_size=1,
            on_first_loaded=lambda: self.set_child(self.content),
        )
