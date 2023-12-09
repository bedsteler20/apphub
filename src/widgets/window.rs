use crate::prelude::*;

static HOME_VIEW_TAG: &str = "home_view";

static HOME_PAGE_TAG: &str = "home_page";

#[derive(GtkWidget, Clone)]
struct Template {
    pub root: adw::ApplicationWindow,
    pub nav_stack: adw::NavigationView,
    pub back_btn: gtk::Button,
    // pub view_switcher: adw::ViewSwitcher,
    pub view_stack: adw::ViewStack,
    // pub switcher_bar: adw::ViewSwitcherBar,
}

pub fn window(app: &adw::Application) -> adw::ApplicationWindow {
    let ui: Template = blueprint!(Template, "src/widgets/window.blp");
    ui.root.set_application(Some(app));
    let ctx = Context {
        app: app.clone(),
        window: ui.root.clone(),
    };

    let home_page = widgets::home_page(&ctx);
    home_page.set_tag(Some(HOME_PAGE_TAG));

    ui.view_stack.add_titled_with_icon(
        &ui.nav_stack,
        Some(HOME_VIEW_TAG),
        &tr!("Explore"),
        "compass-symbolic",
    );
    ui.nav_stack.push(&home_page);

    // ======== View Logic ========
    ui.nav_stack
        .connect_visible_page_notify(clone!(@strong ui => move |view| {
            let page = view.visible_page().unwrap();

            if page.tag().unwrap_or_default().to_string() == HOME_PAGE_TAG {
                ui.back_btn.set_visible(false);
            } else {
                ui.back_btn.set_visible(true);
            }
        }));

    // ======== Actions ========
    let visit_action = gio::SimpleAction::new(
        "navigator.visit",
        Some(&glib::VariantType::new("s").unwrap()),
    );
    let back_action = gio::SimpleAction::new("navigator.back", None);

    app.add_action(&visit_action);
    app.add_action(&back_action);

    back_action.connect_activate(clone!(@strong ui => move |_action, _parameter| {
        ui.nav_stack.pop();
    }));

    visit_action.connect_activate(clone!(@strong ui => move |_action, parameter| {
        let url = parameter.unwrap().get::<String>().unwrap();
        let parts = url.split('/').collect::<Vec<&str>>();
        match parts[1] {
            "app" => {
                let app_id = parts[2];
                let app_page = widgets::app_page(&ctx, &app_id.to_string());
                ui.nav_stack.push(&app_page);
            }
            _ => {
                ui.nav_stack.pop_to_page(&home_page);
            }
        }

    }));

    return ui.root;
}
