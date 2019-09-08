package main

import (
	"fmt"
	"time"
	"github.com/greet"
)

func main() {
	fmt.Println("Welcome to the playground!")

	// declaring vars
	var foo = 2
	bar := "another var"
	var baz int = 2

	// not used is an error!
	//foo2, bar2 := 1, 2

	fmt.Println("The time is", time.Now())
	fmt.Println("The time is", time.Now())
	fmt.Println("printing vars is like this ", foo, " | ", bar, " | ", baz, " | ")

	// printf like C !
	fmt.Printf("type of foo is %T, size of foo is %d \n", foo, foo)

	c := 6 + 7i  
	fmt.Println("complex: ", c)

	greet.Greet("from freeWill")

}
