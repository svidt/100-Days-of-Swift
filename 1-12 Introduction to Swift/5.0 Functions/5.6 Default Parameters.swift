// Just as the *print()* function always adds a newline to the end - it too allows you to use spaces- or anything else, rather than line breaks. Using the *terminator* parameter permits you to change this.  print("hello", terminator: " ")

// We can write a function like this.
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

// You can call this function in two ways.
greet("Taylor")
greet("Taylor", nicely: false)

