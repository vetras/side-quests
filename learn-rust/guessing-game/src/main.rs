use std::io;
use rand::Rng;
use std::process;
use std::cmp::Ordering;

fn main() {
    println!("Guess the number!");
    println!("");
    println!("type 'quit' to exit.");
    println!("");

    let n: u32 = generate_random(1, 100);

    loop {
        println!("========================");
        println!("input your number-guess:");

        let mut guess = String::new();
        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line.");

        // variable shadowing allows us to re-use the guess name! cool
        guess = guess.trim().to_string();

        if guess == "quit" {
            process::exit(0);
        }

        let guess: u32 = match guess.parse() {
            Ok(number) => number,
            Err(_) => {
                println!("Please type a number! '{}' is not a number", guess);
                continue;
            }
        };

        println!("");
        println!("guess={} generated={}", n, guess);
        println!("");

        match guess.cmp(&n) {
            Ordering::Less => println!("The secret number is greater then {}", guess),
            Ordering::Greater => println!("The secret number is smaller then {}", guess),
            Ordering::Equal => {
                println!(" !!! HURRAY you guessed it !!!");
                println!("");
                println!("");

                process::exit(0);
            }
        }
    }
}

fn generate_random(min: u32, max: u32) -> u32 {
    return rand::thread_rng().gen_range(min, max + 1);
}
