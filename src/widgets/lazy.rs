use adw::prelude::*;

pub fn lazy<T: FnOnce(&adw::Bin)>(f: T) -> adw::Bin {
    let bin = adw::Bin::new();
    let spinner = gtk::Spinner::new();
    bin.set_child(Some(&spinner));
    spinner.start();
    f(&bin);
    return bin;
}
