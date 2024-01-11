use flathub_rs::AppHit;
use glib::ToVariant;

use crate::widgets::AppCard;

pub fn load_grid(grid: &gtk::FlowBox, data: &Vec<AppHit>) {

    for app in data {
        let app_widget = AppCard::new();
        app_widget.set_description(app.summary.to_string());
        app_widget.set_icon_url(app.icon.to_string());
        app_widget.set_name(app.name.to_string());
        let app_widget = adw::Clamp::builder()
            .child(&app_widget)
            .orientation(gtk::Orientation::Horizontal)
            .maximum_size(400)
            .halign(gtk::Align::Start)
            .hexpand(true)
            .build();

        let btn = gtk::Button::builder()
            .child(&app_widget)
            .css_classes(vec!["card"])
            .action_name("router.visit.app")
            .action_target(&app.app_id.to_variant())
            .focus_on_click(false)
            .focusable(false)
            .can_focus(false)
            .build();

        let child = gtk::FlowBoxChild::builder()
            .child(&btn)
            .width_request(400)
            .height_request(80)
            .halign(gtk::Align::Fill)
            .hexpand(true)
            .valign(gtk::Align::Fill)
            .build();

        grid.append(&child);
    }
}
