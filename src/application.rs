use adw::prelude::*;
use adw::subclass::prelude::*;
use glib::once_cell::sync::OnceCell;
use gtk::gio;
use gtk::glib;

use crate::config::APP_ID;
use crate::config::RESOURCE_PATH;
use crate::utils::xdg_open;
use crate::utils::Findable;
use crate::views::ApphubWindow;

mod imp {

    use super::*;

    #[derive(Debug, Default)]
    pub struct ApphubApplication {
        pub(super) window: OnceCell<glib::WeakRef<ApphubWindow>>,
        pub(super) context: OnceCell<crate::state::Context>,
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

            if self.context.get().is_none() {
                let context = crate::state::Context::new(app);
                self.context.set(context).unwrap();
            }

            if let Some(window) = self.window.get() {
                let window = window.upgrade().unwrap();
                window.present();
            } else {
                let window = ApphubWindow::new(app);
                self.window
                    .set(window.downgrade())
                    .expect("Window already set.");

                app.main_window().present();
            }
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
            .property("application-id", APP_ID)
            .property("flags", gio::ApplicationFlags::empty())
            .property("resource-base-path", RESOURCE_PATH)
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

    pub fn context(&self) -> crate::state::Context {
        let imp = self.imp();

        match imp.context.get() {
            Some(context) => context.clone(),
            None => {
                let context = crate::state::Context::new(self);
                imp.context.set(context.clone()).unwrap();
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
        ]);
    }

    fn show_about_dialog(&self) {
        let dialog = adw::AboutWindow::from_appdata(
            format!(
                "{}/dev.bedsteler20.Apphub.metainfo.xml",
                self.resource_base_path().unwrap()
            )
            .as_str(),
            None,
        );
        dialog.present();
    }

    pub fn run(&self) -> glib::ExitCode {
        dbg!("Starting Application");
        ApplicationExtManual::run(self)
    }
}

impl Findable for ApphubApplication {
    fn find() -> Self {
        gio::Application::default()
            .expect("No default application set.")
            .downcast::<Self>()
            .expect("Default application is not an ApphubApplication.")
    }
}
