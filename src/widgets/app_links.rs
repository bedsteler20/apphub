use crate::prelude::*;
use utils::open_url;
use bytesize::ByteSize;

#[derive(GtkWidget)]
struct Template {
    root: gtk::FlowBox,
    install_size_label: gtk::Label,
    install_size_card: gtk::Box,
    download_size_label: gtk::Label,
    download_size_card: gtk::Box,
    arch_label: gtk::Label,
    arch_card: gtk::Box,
    license_card: gtk::Box,
    license_label: gtk::Label,
    website_card: gtk::Button,
    website_label: gtk::Label,
    issues_card: gtk::Button,
    issues_label: gtk::Label,
    contribute_card: gtk::Button,
    contribute_label: gtk::Label,
    help_card: gtk::Button,
    help_label: gtk::Label,
    translate_card: gtk::Button,
    translate_label: gtk::Label,
    donate_card: gtk::Button,
    donate_label: gtk::Label,
    manifest_card: gtk::Button,
    manifest_label: gtk::Label,
}

pub fn app_links(app_info: &flathub::AppInfo, summary: &flathub::AppSummary) -> impl IsA<Widget> {
    let ui: Template = blueprint!(Template, "src/widgets/app_links.blp");

    if let Some(links) = app_info.urls.as_ref() {
        if let Some(bugtracker) = links.bugtracker.as_ref() {
            ui.issues_label.set_text(bugtracker);
            ui.root.append(&ui.issues_card);
            ui.issues_card
                .connect_clicked(clone!(@strong bugtracker => move |_| {
                    open_url(bugtracker.clone());
                }));
        }
        if let Some(homepage) = links.homepage.as_ref() {
            ui.website_label.set_text(homepage);
            ui.root.append(&ui.website_card);
            ui.website_card
                .connect_clicked(clone!(@strong homepage => move |_| {
                    open_url(homepage.clone());
                }));
        }
        if let Some(translations) = links.translate.as_ref() {
            ui.translate_label.set_text(translations);
            ui.root.append(&ui.translate_card);
            ui.translate_card
                .connect_clicked(clone!(@strong translations => move |_| {
                    open_url(translations.clone());
                }));
        }
        if let Some(contribute) = links.contribute.as_ref() {
            ui.contribute_label.set_text(contribute);
            ui.root.append(&ui.contribute_card);
            ui.contribute_card
                .connect_clicked(clone!(@strong contribute => move |_| {
                    open_url(contribute.clone());
                }));
        }
        if let Some(donate) = links.donation.as_ref() {
            ui.donate_label.set_text(donate);
            ui.root.append(&ui.donate_card);
            ui.donate_card
                .connect_clicked(clone!(@strong donate => move |_| {
                    open_url(donate.clone());
                }));
        }
        if let Some(help) = links.help.as_ref() {
            ui.help_label.set_text(help);
            ui.root.append(&ui.help_card);
            ui.help_card
                .connect_clicked(clone!(@strong help => move |_| {
                    open_url(help.clone());
                }));
        }
    }

    if let Some(license) = app_info.project_license.as_ref() {
        ui.license_label.set_text(license);
        ui.root.append(&ui.license_card);
    }

    let link = format!("https://github.com/flathub/{}", &app_info.id);
    ui.manifest_label.set_text(&link);
    ui.root.append(&ui.manifest_card);
    ui.manifest_card
        .connect_clicked(clone!(@strong link => move |_| {
            open_url(link.clone());
        }));

    ui.arch_label.set_text(&summary.arches.join(", "));
    ui.root.append(&ui.arch_card);

    ui.install_size_label
        .set_text(ByteSize::b(summary.installed_size).to_string().as_str());
    ui.root.append(&ui.install_size_card);

    ui.download_size_label
        .set_text(ByteSize::b(summary.installed_size).to_string().as_str());
    ui.root.append(&ui.download_size_card);

    return ui.root;
}
