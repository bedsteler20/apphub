use gio::prelude::CancellableExtManual;
use glib::{subclass::types::ObjectSubclassIsExt, ObjectExt};
use gtk::prelude::WidgetExt;

use crate::{
    models::{ApphubTransaction, Context, TransactionType},
    utils::flatpak_utils::is_app_installed,
};
use std::cell::RefCell;

use adw::subclass::prelude::*;
use glib::subclass::InitializingObject;
use gtk::prelude::*;
use gtk::CompositeTemplate;

mod imp {
    use crate::utils::flatpak_utils::get_installed_app;

    use super::*;

    #[derive(CompositeTemplate, Default, glib::Properties)]
    #[properties(wrapper_type = super::ApphubInstallBtn)]
    #[template(file = "src/widgets/install_btn.blp")]
    pub struct ApphubInstallBtn {
        #[template_child]
        pub install_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub update_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub open_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub progress_box: TemplateChild<gtk::Box>,
        #[template_child]
        pub progress_bar: TemplateChild<gtk::ProgressBar>,
        #[template_child]
        pub progress_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub uninstall_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub cancel_btn: TemplateChild<gtk::Button>,
        #[property(get, set)]
        pub app_id: RefCell<String>,
        #[property(get, set)]
        pub bundle: RefCell<String>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubInstallBtn {
        const NAME: &'static str = "ApphubInstallBtn";
        type Type = super::ApphubInstallBtn;
        type ParentType = gtk::Box;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
            klass.bind_template_callbacks();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    #[glib::derived_properties]
    impl ObjectImpl for ApphubInstallBtn {
        fn constructed(&self) {
            self.parent_constructed();
            self.obj()
                .connect_app_id_notify(super::ApphubInstallBtn::on_app_id_changed);
        }
    }

    #[gtk::template_callbacks]
    impl ApphubInstallBtn {
        #[template_callback]
        fn on_install_btn_clicked(&self, _btn: &gtk::Button) {
            self.obj().set_state(InstallBtnState::Running);
            let app_id = self.obj().app_id();
            let bundle = self.obj().bundle();
            let context = Context::default();
            let transaction = context.transactions().add_install(app_id, bundle);
            self.obj().bind_transaction(&transaction);
            transaction.start();
        }

        #[template_callback]
        fn on_update_btn_clicked(&self, _btn: &gtk::Button) {
            if let Some(app) = Context::default().updates_list().get(&self.obj().app_id()) {
                let context = Context::default();
                let transaction = context.transactions().add_update(app);
                self.obj().bind_transaction(&transaction);
                transaction.start();
            }
        }

        #[template_callback]
        fn on_open_btn_clicked(&self, _btn: &gtk::Button) {
            let app_id = self.obj().app_id();
            glib::spawn_command_line_async(&format!("flatpak run {}", app_id)).unwrap();
        }

        #[template_callback]
        fn on_uninstall_btn_clicked(&self, _btn: &gtk::Button) {
            // TODO: Show confirmation dialog
            if let Some(app) = get_installed_app(&self.obj().app_id()) {
                let context = Context::default();
                let transaction = context.transactions().add_uninstall(app);
                self.obj().bind_transaction(&transaction);
                transaction.start();
            }
        }

        #[template_callback]
        fn on_cancel_btn_clicked(&self, _btn: &gtk::Button) {
            let context = Context::default();
            let transaction = context.transactions().get_transaction(&self.obj().app_id());
            if let Some(transaction) = transaction {
                transaction.cancel();
                self.obj()
                    .set_state(InstallBtnState::Cancel(transaction.transaction_type()));
            }
        }
    }

    impl WidgetImpl for ApphubInstallBtn {}
    impl BoxImpl for ApphubInstallBtn {}
}

glib::wrapper! {
    pub struct ApphubInstallBtn(ObjectSubclass<imp::ApphubInstallBtn>)
    @extends gtk::Box, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable,
                gtk::ConstraintTarget;
}

impl ApphubInstallBtn {
    fn set_progress(&self, progress: f64) {
        self.imp().progress_bar.set_fraction(progress);
        self.imp()
            .progress_label
            .set_text(&format!("{:.2}%", progress * 100.0));
    }

    fn bind_transaction(&self, transaction: &ApphubTransaction) {
        self.set_state(InstallBtnState::Running);
        self.set_progress(transaction.progress());
        transaction.connect_progress_notify({
            let this = self.clone();
            move |transaction| {
                this.set_progress(transaction.progress());
            }
        });

        transaction.connect_error_notify({
            let this = self.clone();
            move |transaction| {
                let error = transaction.error().unwrap();
                this.set_state(InstallBtnState::Error(
                    transaction.transaction_type(),
                    error,
                ));
            }
        });

        transaction.connect_is_done_notify({
            let this = self.clone();
            move |transaction| {
                if transaction.is_done() {
                    this.set_state(InstallBtnState::Done(transaction.transaction_type()));
                }
            }
        });
    }

    fn on_app_id_changed(&self) {
        let app_id = self.app_id();
        let context = Context::default();
        if context.transactions().has_transaction(&app_id) {
            let transaction = context.transactions().get_transaction(&app_id).unwrap();
            self.bind_transaction(&transaction);
        } else if context.updates_list().has_update(&app_id) {
            self.set_state(InstallBtnState::Update);
        } else if is_app_installed(&app_id) {
            self.set_state(InstallBtnState::Uninstall);
        } else {
            self.set_state(InstallBtnState::Install);
        }
    }

    fn set_state(&self, state: InstallBtnState) {
        let imp = self.imp();
        imp.install_btn.set_visible(false);
        imp.update_btn.set_visible(false);
        imp.open_btn.set_visible(false);
        imp.progress_box.set_visible(false);
        imp.uninstall_btn.set_visible(false);
        imp.cancel_btn.set_visible(false);

        match state {
            InstallBtnState::Install => {
                imp.install_btn.set_visible(true);
            }
            InstallBtnState::Update => {
                imp.update_btn.set_visible(true);
                imp.uninstall_btn.set_visible(true);
            }
            InstallBtnState::Uninstall => {
                imp.open_btn.set_visible(true);
                imp.uninstall_btn.set_visible(true);
            }
            InstallBtnState::Running => {
                imp.progress_box.set_visible(true);
                imp.cancel_btn.set_visible(true);
            }
            InstallBtnState::Error(TransactionType::Install, _error) => {
                imp.install_btn.set_visible(true);
            }
            InstallBtnState::Error(TransactionType::Update, _error) => {
                imp.update_btn.set_visible(true);
                imp.uninstall_btn.set_visible(true);
            }
            InstallBtnState::Error(TransactionType::Uninstall, _error) => {
                imp.open_btn.set_visible(true);
                imp.uninstall_btn.set_visible(true);
            }
            InstallBtnState::Done(TransactionType::Install) => {
                imp.open_btn.set_visible(true);
                imp.uninstall_btn.set_visible(true);
            }
            InstallBtnState::Done(TransactionType::Update) => {
                imp.open_btn.set_visible(true);
                imp.uninstall_btn.set_visible(true);
            }
            InstallBtnState::Done(TransactionType::Uninstall) => {
                imp.install_btn.set_visible(true);
            }
            InstallBtnState::Cancel(TransactionType::Install) => {
                imp.install_btn.set_visible(true);
            }
            InstallBtnState::Cancel(TransactionType::Update) => {
                imp.update_btn.set_visible(true);
                imp.uninstall_btn.set_visible(true);
            }
            InstallBtnState::Cancel(TransactionType::Uninstall) => {
                imp.open_btn.set_visible(true);
                imp.uninstall_btn.set_visible(true);
            }
        };
    }
}

enum InstallBtnState {
    Install,
    Update,
    Uninstall,
    Running,
    Error(TransactionType, String),
    Done(TransactionType),
    Cancel(TransactionType),
}
