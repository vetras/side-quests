
// create modules on other files using naming convention
mod sound;
mod plant;

// create modules directly
mod performance_group {
    use crate::sound::instrument::clarinet as pipes;

    pub fn clarinet_trio() {
        println!("the trio will now play:");
        pipes();
        pipes();
        pipes();
    }
}

use plant::Flowers;

fn main() {
    println!("");

    // Absolute path
    crate::sound::instrument::clarinet();

    // Relative path
    sound::instrument::clarinet();

    let n = generate_random(1, 2);

    sound::voice::sing(n==1);

    // structs

    let mut v = plant::Vegetable::new("squash");

    v.name = String::from("butternut squash");

    // v.id is private. it does not exist here!

    println!("");
    println!("{} are delicious", v.name);

    println!("");
    println!("Flowers: {:?}, {:?}", Flowers::Camomile, Flowers::Orchid);

    println!("");
    performance_group::clarinet_trio();

    println!("");
}

fn generate_random(min: u32, max: u32) -> u32 {
    use rand::Rng;
    return rand::thread_rng().gen_range(min, max + 1);
}
