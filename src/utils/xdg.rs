pub fn xdg_open(url: &str) {
    glib::spawn_command_line_async(format!("xdg-open {}", url).as_str()).unwrap();
}
