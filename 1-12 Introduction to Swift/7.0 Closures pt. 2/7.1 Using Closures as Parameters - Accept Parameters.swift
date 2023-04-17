// This time instead of using " () -> Void " which means "accepting no parameters and returns nothing" - as we have done earlier. Now we can fill the " ( ) ". To demonstrate this, we can write a *travel()* function that accepts a closure as its only parameter and that closure in turn accepts a *string*.

import Foundation

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

// We now call *travel()* using trailing closure syntax, the closure code is required to accept a *string*.
travel { (place: String) in
    print("I'm going to \(place) in my car")
}
