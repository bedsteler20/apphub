use gtk::glib::Variant;
use gtk::prelude::*;
use gtk::Widget;
use macros::GtkWidget;

use crate::blueprint;
use crate::flathub;
use crate::widgets;
#[derive(GtkWidget)]
struct Template {
    pub root: adw::Clamp,
    pub btn: gtk::Button,
    pub image: gtk::Image,
    pub name_label: gtk::Label,
    pub description_label: gtk::Label,
    // pub verified_box: gtk::Box,
    // pub verified_label: gtk::Label,
}

pub fn app_card(app: &flathub::AppHit) -> impl IsA<Widget> {
    let ui: Template = blueprint!(Template, "src/widgets/app_card.blp");
    ui.name_label.set_text(&app.name);
    ui.description_label.set_text(&app.summary);

    ui.image.set_from_icon_name(Some("image-missing"));
    ui.btn.set_action_name(Some("app.navigator.visit"));
    ui.btn
        .set_action_target_value(Some(&Variant::from(format!("/app/{}", &app.app_id))));
    if let Some(icon) = app.icon.as_ref() {
        widgets::image(icon, &ui.image);
    }
    // BUG: After navigation to a new page the button is staying focused
    // preventing the user from scrolling with the mouse wheel.
    ui.btn.set_focus_on_click(false);

    return ui.root;
}
