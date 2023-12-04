use gtk::glib;
use gtk::glib::Variant;
use gtk::prelude::*;
use gtk::Widget;
use macros::GtkWidget;

use crate::blueprint;
use crate::flathub;
use crate::widgets;
#[derive(GtkWidget)]
struct Template {
    pub root: gtk::Button,
    pub image: gtk::Image,
    pub name_label: gtk::Label,
    pub description_label: gtk::Label,
    pub verified_box: gtk::Box,
    pub verified_label: gtk::Label,
}

pub fn app_card(app: &flathub::AppHit) -> impl IsA<Widget> {
    let ui: Template = blueprint!(Template, "src/widgets/app_card.blp");
    ui.name_label.set_text(&app.name);
    ui.description_label.set_text(&app.summary);
    
    ui.image.set_from_icon_name(Some("image-missing"));
    ui.root.set_action_name(Some("navigator.visit"));
    ui.root
        .set_action_target_value(Some(&Variant::from(format!("/app/{}", &app.id))));
    if let Some(icon) = app.icon.as_ref() {
        widgets::image(icon, &ui.image);
    }

    return ui.root;
}
