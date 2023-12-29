fn main() {
    println!("cargo:rerun-if-changed=src/assets/resources.xml");
    glib_build_tools::compile_resources(
        &["src/assets"],
        "src/assets/resources.xml",
        "compiled.gresource",
    );
}
