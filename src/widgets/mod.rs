mod app_card;
mod app_links;
mod image;
mod install_btn;

pub use app_card::AppCard;
pub use app_links::ApphubAppLinks;
pub use image::load_image;
pub use image::load_picture;
pub use install_btn::ApphubInstallBtn;

pub trait CreateWeekRef<T>
where
    T: glib::IsA<glib::Object> + Clone + 'static,
{
    fn week_ref(&self) -> glib::WeakRef<T>;
}

impl<T> CreateWeekRef<T> for T
where
    T: glib::IsA<glib::Object> + Clone + 'static,
{
    fn week_ref(&self) -> glib::WeakRef<T> {
        let r = glib::WeakRef::new();
        r.set(Some(self));
        r
    }
}
