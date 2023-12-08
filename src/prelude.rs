// ======= External Preludes =======
pub use adw::prelude::*;
#[allow(unused_imports)]
pub use gtk::gdk::prelude::*;
#[allow(unused_imports)]
pub use gtk::gdk_pixbuf::prelude::*;
#[allow(unused_imports)]
pub use gtk::gio::prelude::*;
#[allow(unused_imports)]
pub use gtk::glib::prelude::*;
#[allow(unused_imports)]
pub use gtk::prelude::*;
pub use libflatpak::prelude::*;

// ======= GLib libraries =======
pub use ashpd as xdg_portal;
pub use gtk::gdk;
pub use gtk::gdk_pixbuf;
pub use gtk::gio;
pub use gtk::glib;

// ======= Common GLib Types =======
pub use glib::IsA;
pub use glib::SignalHandlerId;
pub use gtk::gio::Cancellable;
pub use gtk::glib::translate::FromGlib;
pub use gtk::glib::translate::ToGlibPtr;
pub use gtk::glib::translate::ToGlibPtrMut;
pub use gtk::glib::Bytes;
pub use gtk::glib::Error as GError;
pub use gtk::glib::Variant;
pub use gtk::glib::VariantTy;
pub use gtk::glib::VariantType;
pub use gtk::Widget;

// ======= Common Standard Library Types =======
pub use once_cell::sync::Lazy as OnceCell;
pub use serde::Deserialize;
pub use serde::Serialize;
pub use std::cell::Ref;
pub use std::cell::RefCell;
pub use std::cell::RefMut;
pub use std::rc::Rc;
pub use std::sync::Arc;
pub use  std::sync::mpsc;
// ======= Macros =======
pub use crate::blueprint;
pub use gtk::glib::clone;
pub use macros::GtkWidget;
pub use tr::tr;
// ======= Globals =======
pub use crate::utils::runtime;
pub use crate::utils::APP_ID;
pub use crate::utils::BASE_URL;
pub use crate::utils::RESOURCE_PATH;

// ======= Re-Export Modules =======
pub use crate::flathub;
pub use crate::flatpak;
pub use crate::store;
pub use crate::utils;
pub use crate::utils::Context;
pub use crate::widgets;
