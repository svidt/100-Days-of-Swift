// This *travel()* function accepts one parameter, which is a closure that in itself accepts one parameter and returns a string. That closure is then run between two *print()* calls.

import Foundation

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

//Here's how you would call this closure.
travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// Now lets see how short we can make it. Swift knows the parameter to that closure must be a string, so we can remove it.
travel { place -> String in
    return "I'm going to \(place) in my car"
}

//Swift also knows the closure must return a string, so we can remove that as well.
travel { place in
    return "I'm going to \(place) in my car"
}

// Lastly, as the closure only has one line of code, that must be the one that returns the value, so Swift lets us remove the *return* keyword too.
travel { place in
    "I'm going to \(place) in my car"
}

//BONUS: Swift has a shorthand syntax that lets you go even shorter. Rather than writing *place in* we can let Swift provide automatic names for the closure's parameters. These are named with a dollar sign ( $ ), then a number counting from 0.
travel {
    "I'm going to \($0) in my car"
}
