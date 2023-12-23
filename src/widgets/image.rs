use gtk::gdk_pixbuf;

use crate::utils::call_me_maybe;
use adw::prelude::*;

#[allow(deprecated)]
pub fn load_image(url: &String, img: &gtk::Image) {
    call_me_maybe(
        {
            let url = url.clone();
            async move {
                reqwest::get(url)
                    .await
                    .expect("Unable to get image")
                    .bytes()
                    .await
                    .expect("Unable to get image bytes")
            }
        },
        {
            let img = img.clone();
            move |bytes| {
                let pixbuf = gdk_pixbuf::PixbufLoader::new();
                pixbuf
                    .write(&bytes)
                    .expect("Unable to write to the pixbuf.");
                pixbuf.close().expect("Unable to close the pixbuf.");
                let pixbuf = pixbuf.pixbuf().expect("Unable to get the pixbuf.");
                img.set_from_pixbuf(Some(&pixbuf));
            }
        },
    );
}



pub fn load_picture(url: &String, img: &gtk::Picture) {
    call_me_maybe(
        {
            let url = url.clone();
            async move {
                reqwest::get(url)
                    .await
                    .expect("Unable to get image")
                    .bytes()
                    .await
                    .expect("Unable to get image bytes")
            }
        },
        {
            let img = img.clone();
            move |bytes| {
                let pixbuf = gdk_pixbuf::PixbufLoader::new();
                pixbuf
                    .write(&bytes)
                    .expect("Unable to write to the pixbuf.");
                pixbuf.close().expect("Unable to close the pixbuf.");
                let pixbuf = pixbuf.pixbuf().expect("Unable to get the pixbuf.");
                let texture = gtk::gdk::Texture::for_pixbuf(&pixbuf);
                img.set_paintable(Some(&texture));
            }
        },
    );
}