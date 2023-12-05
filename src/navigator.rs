use gtk::{
    gio,
    glib::{self, clone},
    prelude::ActionMapExt,
};

use crate::widgets;

pub fn connect_navigator(
    app: &adw::Application,
    _window: &adw::ApplicationWindow,
    view: &adw::NavigationView,
) {
    let home = widgets::home_page();
    view.push(&home);

    // Register actions
    let visit_action = gio::SimpleAction::new(
        "navigator.visit",
        Some(&glib::VariantType::new("s").unwrap()),
    );
    let back_action = gio::SimpleAction::new("navigator.back", None);

    app.add_action(&visit_action);
    app.add_action(&back_action);

    // Connect actions
    back_action.connect_activate(clone!(@weak view => move |_action, _parameter| {
        view.pop();
    }));
    visit_action.connect_activate(clone!(@weak view => move |_action, parameter| {
        let url = parameter.unwrap().get::<String>().unwrap();
        let parts = url.split('/').collect::<Vec<&str>>();
        match parts[1] {
            "app" => {
                let app_id = parts[2];
                println!("Visiting app {}", app_id);
                let app_page = widgets::app_page(&app_id.to_string());
                view.push(&app_page);
            }
            _ => {
                view.pop_to_page(&home);
            }
        }

    }));
}
