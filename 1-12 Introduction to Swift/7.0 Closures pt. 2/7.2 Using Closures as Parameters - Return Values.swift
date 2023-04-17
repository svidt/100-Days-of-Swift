// You can replace *Void* with any type of data to force the closure to return a value. Let's rewrite the *travel()* function so that it accepts a closure as its only parameter and that closure in turn accepts a string and returns a string.

import Foundation

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

// You call the *travel()* function using trailing closure syntax, the closure code is required to accept a string and return a string.
travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
