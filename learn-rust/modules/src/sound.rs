pub mod instrument {
    pub fn clarinet() {
        println!("playing the clarinet...");
    }
}

pub mod voice {
    pub fn sing(flag:bool ) {
        if flag {
            println!("singing well...");
        } else {
            return sing_bad();
        }
    }

    // this is private. main can't reach it directly
    fn sing_bad() {
        println!("singing bad...");
    }
}