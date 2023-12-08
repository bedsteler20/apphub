use crate::prelude::*;

pub fn lazy<T: FnOnce(&adw::Bin)>(f: T) -> adw::Bin {
    let bin = adw::Bin::new();
    let box_ = gtk::Box::new(gtk::Orientation::Vertical, 0);
    box_.set_halign(gtk::Align::Center);
    box_.set_valign(gtk::Align::Center);

    box_.set_size_request(64, 64);
    let spinner = gtk::Spinner::new();
    spinner.set_size_request(64, 64);
    box_.append(&spinner);
    bin.set_child(Some(&box_));
    spinner.start();
    f(&bin);
    return bin;
}
