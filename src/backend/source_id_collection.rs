use gtk::glib::{SourceId, translate::FromGlib};


#[derive(Clone)]
pub struct SourceIdCollection {
    source_ids: Vec<u32>,
}

impl SourceIdCollection {
    pub fn new() -> SourceIdCollection {
        SourceIdCollection {
            source_ids: Vec::new(),
        }
    }

    pub fn add(&mut self, source_id: SourceId) {
        self.source_ids.push(source_id.as_raw());
    }

    pub fn remove(&mut self) {
        for s in self.source_ids.iter() {
            unsafe {
                let sid = SourceId::from_glib(s.clone());
                sid.remove();
            }
            break;
        }
    }
}