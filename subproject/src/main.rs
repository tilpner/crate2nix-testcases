static DATE: &'static str = include_str!("../../version");

fn main() {
    println!("Hi! This is subproject from {}", DATE)
}
