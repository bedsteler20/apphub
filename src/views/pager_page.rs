use crate::{
    navigator::Navigator,
    utils::{call_me_maybe, load_grid, Findable},
};
use adw::subclass::prelude::*;
use gtk::prelude::*;
use gtk::CompositeTemplate;

use super::ApphubWindow;
use tr::tr;
mod imp {
    use super::*;

    #[derive(Debug, Default, CompositeTemplate)]
    #[template(file = "src/views/pager_page.blp")]
    pub struct PagerPage {
        #[template_child]
        pub flow_box: TemplateChild<gtk::FlowBox>,
        #[template_child]
        pub root: TemplateChild<gtk::ScrolledWindow>,
        #[template_child]
        pub stack: TemplateChild<gtk::Stack>,
        #[template_child]
        pub btn_f: TemplateChild<gtk::Button>,
        #[template_child]
        pub dots_f: TemplateChild<gtk::Label>,
        #[template_child]
        pub btn_1: TemplateChild<gtk::Button>,
        #[template_child]
        pub btn_2: TemplateChild<gtk::Button>,
        #[template_child]
        pub btn_3: TemplateChild<gtk::Button>,
        #[template_child]
        pub btn_4: TemplateChild<gtk::Button>,
        #[template_child]
        pub btn_5: TemplateChild<gtk::Button>,
        #[template_child]
        pub dots_l: TemplateChild<gtk::Label>,
        #[template_child]
        pub btn_l: TemplateChild<gtk::Button>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for PagerPage {
        const NAME: &'static str = "ApphubPagerPage";
        type Type = super::PagerPage;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &glib::subclass::InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for PagerPage {}
    impl WidgetImpl for PagerPage {}
    impl BinImpl for PagerPage {}
}

glib::wrapper! {
    pub struct PagerPage(ObjectSubclass<imp::PagerPage>)
        @extends gtk::Widget, adw::Bin;
}

impl PagerPage {
    pub fn new(nav: PagerNavigator) -> Self {
        let this: Self = glib::Object::builder().build();
        this.load_data(nav);
        return this;
    }

    async fn fetch_data(
        nav: PagerNavigator,
    ) -> Result<flathub_rs::Pagination<flathub_rs::AppHit>, flathub_rs::Error> {
        match nav {
            PagerNavigator::Popular(p) => flathub_rs::popular_apps(p, 48).await,
            PagerNavigator::RecentlyUpdated(p) => flathub_rs::recently_updated_apps(p, 48).await,
            PagerNavigator::NewApps(p) => flathub_rs::recently_added_apps(p, 48).await,
        }
    }

    fn load_data(&self, nav: PagerNavigator) {
        let this = self.clone();
        let path = nav
            .route()
            .split("/")
            .collect::<Vec<&str>>()
            .split_last()
            .unwrap()
            .1
            .join("/");

        call_me_maybe(async move { Self::fetch_data(nav).await }, move |data| {
            if let Ok(data) = data {
                load_grid(&this.imp().flow_box, &data.hits);
                this.imp().stack.set_visible_child(&this.imp().root.get());
                this.setup_dots(data.page, data.total_pages, &path);
            } else if let Err(err) = data {
                ApphubWindow::find().show_error_page(err.into());
            }
        });
    }

    fn setup_dots(&self, current_page: i32, max_pages: i32, path: &str) {
        fn connect_btn(btn: &gtk::Button, path: &str) {
            let path = path.to_string();
            btn.connect_clicked(move |btn| {
                let page = btn.label().unwrap().parse::<i32>().unwrap();
                ApphubWindow::find().navigate_to(&format!("{}/{}", path, page));
            });
        }
        let imp = self.imp();
        imp.btn_3.set_label(&current_page.to_string());
        imp.btn_l.set_label(&max_pages.to_string());
        imp.btn_f.set_label("1");
        let mut i = current_page;

        connect_btn(&imp.btn_1.get(), path);
        connect_btn(&imp.btn_2.get(), path);
        connect_btn(&imp.btn_3.get(), path);
        connect_btn(&imp.btn_4.get(), path);
        connect_btn(&imp.btn_5.get(), path);
        connect_btn(&imp.btn_f.get(), path);
        connect_btn(&imp.btn_l.get(), path);
        if current_page > 2 {
            i -= 1;
            imp.btn_2.set_visible(true);
            imp.btn_2.set_label(&i.to_string());
        } else {
            imp.btn_2.set_visible(false);
        }

        if current_page > 1 {
            i -= 1;
            imp.btn_1.set_visible(true);
            imp.btn_1.set_label(&i.to_string());
        } else {
            imp.btn_1.set_visible(false);
        }

        if current_page > 3 {
            imp.btn_f.set_visible(true);
        } else {
            imp.btn_f.set_visible(false);
        }

        if current_page > 4 {
            imp.dots_f.set_visible(true);
        } else {
            imp.dots_f.set_visible(false);
        }

        if max_pages >= current_page + 1 {
            imp.btn_4.set_label(&(current_page + 1).to_string());
            imp.btn_4.set_visible(true);
        } else {
            imp.btn_4.set_visible(false);
        }

        if max_pages >= current_page + 2 {
            imp.btn_5.set_label(&(current_page + 2).to_string());
            imp.btn_5.set_visible(true);
        } else {
            imp.btn_5.set_visible(false);
        }

        if max_pages >= current_page + 3 {
            imp.btn_l.set_visible(true);
        } else {
            imp.btn_l.set_visible(false);
        }

        if max_pages >= current_page + 4 {
            imp.dots_l.set_visible(true);
        } else {
            imp.dots_l.set_visible(false);
        }
    }
}

#[derive(Clone, Debug)]
pub enum PagerNavigator {
    Popular(i32),
    RecentlyUpdated(i32),
    NewApps(i32),
}

impl Navigator for PagerNavigator {
    fn route(&self) -> String {
        match self {
            PagerNavigator::Popular(p) => format!("/pager/popular/{}", p),
            PagerNavigator::RecentlyUpdated(p) => format!("/pager/recently-updated/{}", p),
            PagerNavigator::NewApps(p) => format!("/pager/new-apps/{}", p),
        }
    }

    fn matches(&self, route: &str) -> bool {
        match self {
            PagerNavigator::Popular(p) => route == format!("/pager/popular/{}", p),
            PagerNavigator::RecentlyUpdated(p) => route == format!("/pager/recently-updated/{}", p),
            PagerNavigator::NewApps(p) => route == format!("/pager/new-apps/{}", p),
        }
    }

    fn parse(route: &str) -> Self {
        let parts: Vec<&str> = route.split("/").collect();
        if parts.len() < 4 {
            panic!("Invalid route {}", route)
        } else if parts.len() == 4 {
            let page = parts[2];
            let page_num = parts[3].parse::<i32>().unwrap();
            match page {
                "popular" => PagerNavigator::Popular(page_num),
                "recently-updated" => PagerNavigator::RecentlyUpdated(page_num),
                "new-apps" => PagerNavigator::NewApps(page_num),
                _ => panic!("Invalid route {}", route),
            }
        } else if parts.len() == 5 {
            let page = parts[2];
            let option = parts[3];
            let page_num = parts[4].parse::<i32>().unwrap();

            println!("page: {}, option: {}, page_num: {}", page, option, page_num);
            panic!("Invalid route {}", route)
        } else {
            panic!("Invalid route {}", route)
        }
    }

    fn create_page(&self) -> adw::NavigationPage {
        match self {
            PagerNavigator::NewApps(_) => adw::NavigationPage::builder()
                .title(tr!("New Apps"))
                .child(&PagerPage::new(self.clone()))
                .build(),
            PagerNavigator::Popular(_) => adw::NavigationPage::builder()
                .title(tr!("Popular"))
                .child(&PagerPage::new(self.clone()))
                .build(),
            PagerNavigator::RecentlyUpdated(_) => adw::NavigationPage::builder()
                .title(tr!("Recently Updated"))
                .child(&PagerPage::new(self.clone()))
                .build(),
        }
    }
}
