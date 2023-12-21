use adw::prelude::*;
use adw::subclass::prelude::*;
use glib::once_cell::sync::OnceCell;
use gtk::gio;
use gtk::glib;

use crate::utils::xdg_open;
use crate::views::ApphubWindow;

mod imp {

    use super::*;

    #[derive(Debug, Default)]
    pub struct ApphubApplication {
        pub(super) window: OnceCell<glib::WeakRef<ApphubWindow>>,
        pub(super) context: glib::WeakRef<crate::models::Context>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubApplication {
        const NAME: &'static str = "ApphubApplication";
        type Type = super::ApphubApplication;
        type ParentType = adw::Application;
    }

    impl ObjectImpl for ApphubApplication {}
    impl ApplicationImpl for ApphubApplication {
        fn activate(&self) {
            self.parent_activate();
            let app = &self.obj();

            if self.context.upgrade().is_none() {
                let context = crate::models::Context::new(app);
                self.context.set(Some(&context));
            }

            if let Some(window) = self.window.get() {
                let window = window.upgrade().unwrap();
                window.present();
                return;
            }

            let window = ApphubWindow::new(app);
            self.window
                .set(window.downgrade())
                .expect("Window already set.");

            app.main_window().present();
        }

        fn startup(&self) {
            self.parent_startup();
            let app = &*self.obj();

            gtk::Window::set_default_icon_name("dev.bedsteler20.Apphub");
            app.setup_actions();
        }
    }
    impl GtkApplicationImpl for ApphubApplication {}
    impl AdwApplicationImpl for ApphubApplication {}
}

glib::wrapper! {
    pub struct ApphubApplication(ObjectSubclass<imp::ApphubApplication>)
        @extends gio::Application, gtk::Application, adw::Application,
        @implements gio::ActionMap, gio::ActionGroup;
}

impl ApphubApplication {
    pub fn new() -> Self {
        glib::Object::builder()
            .property("application-id", "dev.bedsteler20.Apphub")
            .property("flags", gio::ApplicationFlags::empty())
            .property("resource-base-path", "/dev/bedsteler20/Apphub/")
            .build()
    }

    pub fn main_window(&self) -> ApphubWindow {
        let imp = self.imp();

        match imp.window.get() {
            Some(window) => window.upgrade().unwrap(),
            None => {
                let window = ApphubWindow::new(self);
                imp.window.set(window.downgrade()).unwrap();
                window
            }
        }
    }

    pub fn context(&self) -> crate::models::Context {
        let imp = self.imp();

        match imp.context.upgrade() {
            Some(context) => context,
            None => {
                let context = crate::models::Context::new(self);
                imp.context.set(Some(&context));
                context
            }
        }
    }

    fn setup_actions(&self) {
        self.add_action_entries([
            // Quit
            gio::ActionEntry::builder("quit")
                .activate(move |app: &Self, _, _| {
                    app.main_window().close();
                    app.quit();
                })
                .build(),
            // About
            gio::ActionEntry::builder("about")
                .activate(|app: &Self, _, _| {
                    app.show_about_dialog();
                })
                .build(),
            // Open URL
            gio::ActionEntry::builder("open-url")
                .activate(|_, _, opts| {
                    if let Some(opts) = opts {
                        if let Some(url) = opts.get::<String>() {
                            xdg_open(url.as_str());
                        }
                    }
                })
                .parameter_type(Some(&glib::VariantType::new("s").unwrap()))
                .build(),
        ]);
    }

    fn show_about_dialog(&self) {
        unimplemented!()
    }

    pub fn run(&self) -> glib::ExitCode {
        dbg!("Starting Application");
        ApplicationExtManual::run(self)
    }
}
