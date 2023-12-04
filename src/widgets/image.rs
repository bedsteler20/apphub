use {
    crate::utils::RUNTIME,
    async_channel::{self},
    gtk::{
        gdk_pixbuf::{self, prelude::*},
        glib::{self, clone},
    },
    reqwest::{self},
};

#[allow(deprecated)]
pub fn image(url: &String, img: &gtk::Image) {
    let (sender, receiver) = async_channel::bounded(1);
    RUNTIME.spawn(clone!(@strong sender, @strong url => async move {
        let response = reqwest::get(url).await;
        sender.send(response).await.expect("The channel needs to be open.");
    }));

    glib::spawn_future_local(clone!(@strong img => async move {
        while let Ok(response) = receiver.recv().await {
            if let Ok(response) = response {
                let bytes = response.bytes().await;
                if let Ok(bytes) = bytes {
                    let pixbuf = gdk_pixbuf::PixbufLoader::new();
                    pixbuf.write(&bytes).expect("Unable to write to the pixbuf.");
                    pixbuf.close().expect("Unable to close the pixbuf.");
                    let pixbuf = pixbuf.pixbuf().expect("Unable to get the pixbuf.");
                    img.set_from_pixbuf(Some(&pixbuf));
                } else {
                    println!("Could not parse the response.");
                }

            } else {
                println!("Could not make a `GET` request.");
            }
            receiver.close();
            sender.close();
            break;
        }
    }));
}
