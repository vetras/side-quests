#[derive(Debug)] // native trait, allows us to print this
struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

// adding methods to structs
impl User {
    fn is_locked_out(&self) -> bool {
        self.sign_in_count >= 2
    }
    // if a method mutates date, needs to be explicit
    fn increment_login_attempt(&mut self) {
        self.sign_in_count = self.sign_in_count + 1;
    }
}

// tuple structs
struct Color(i32, i32, i32);

fn main() {
    println!("=================");
    println!("     Structs     ");
    println!("=================");
    println!("");
    println!("");

    // create a struct instance
    let user1 = User {
        username: String::from("foo"),
        email: String::from("someuser@name123"),
        active: true,
        sign_in_count: 1,
    };

    // compile time error because user1 is not mut
    //user1.increment_login_attempt();

    // copy one struct to another -- struct update syntax
    let mut user2 = User {
        username: String::from("bar"),
        ..user1
    };

    user2.increment_login_attempt();

    if user2.is_locked_out() {
        println!("This user IS locked out | {:?}", user2);
    } else {
        println!("This user IS NOT locked out | {:?}", user2);
    }
    println!("");

    let black = Color(10, 20, 30);

    println!("Black is {} {} {}", black.0, black.1, black.2);
}
