use std::io;
use std::process;

fn main() {
    println!("Hello, this is a fibonacci calculator!");
    println!("type 'quit' to exit.");
    println!("");

    loop {
        let n = read_user_input();

        let result = fib(n);

        println!("The fib({}) = {}", n, result);
        println!("=====================");
    }
}

fn fib(n: u32) -> u32 {
    if n == 0 {
        return 0;
    }
    if n == 1 {
        return 1;
    }
    return fib(n - 1) + fib(n - 2);
}

fn read_user_input() -> u32 {
    // a loop returns the value from the break!
    loop {
        println!("Choose a number:");

        let mut n = String::new();

        io::stdin().read_line(&mut n).expect("Failed to read line.");

        let n = n.trim();

        if n == "quit" {
            process::exit(0);
        }

        let n = match n.parse() {
            Ok(number) => number,
            Err(_) => {
                println!("Please type a number! '{}' is not a number", n);
                continue;
            }
        };
        // break returns n
        break n;
    }
}
