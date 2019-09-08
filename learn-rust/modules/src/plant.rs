
pub struct Vegetable {
    pub name: String,
    #[allow(dead_code)] id: i32
}

impl Vegetable {
    pub fn new(name: &str) -> Vegetable {
        Vegetable {
            name: String::from(name),
            id: 1,
        }
    }
}

// unlike struct fields, all enumerations are all public or all private
#[derive(Debug)] pub enum Flowers {
    Camomile,
    Orchid,
}