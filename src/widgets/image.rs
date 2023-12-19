use gtk::gdk_pixbuf;

use crate::prelude::*;

#[allow(deprecated)]
pub fn load_image(url: &String, img: &gtk::Image) {
    let (sender, receiver) =
        glib::MainContext::channel::<Result<Vec<u8>>>(glib::Priority::default());

    glib::spawn_future({
        let url = url.clone();

        async move {
            let response = surf::get(url).await;
            if let Ok(mut res) = response {
                let bytes = res.body_bytes().await;
                if let Ok(bytes) = bytes {
                    sender.send(Ok(bytes)).unwrap();
                } else if let Err(err) = bytes {
                    sender.send(Err(err.into())).unwrap();
                }
            } else if let Err(err) = response {
                sender.send(Err(err.into())).unwrap();
            }
        }
    });

    receiver.attach(Default::default(), {
        let img = img.clone();
        move |res| {
            if let Ok(bytes) = res {
                let pixbuf = gdk_pixbuf::PixbufLoader::new();
                pixbuf
                    .write(&bytes)
                    .expect("Unable to write to the pixbuf.");
                pixbuf.close().expect("Unable to close the pixbuf.");
                let pixbuf = pixbuf.pixbuf().expect("Unable to get the pixbuf.");
                img.set_from_pixbuf(Some(&pixbuf));
            } else if let Err(err) = res {
                eprintln!("Unable to load image: {}", err.to_string());
            }
            glib::ControlFlow::Break
        }
    });
}
