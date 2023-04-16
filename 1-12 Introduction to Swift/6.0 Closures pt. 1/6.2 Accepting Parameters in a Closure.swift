// To make a closure accept parameters, list them inside parentheses just after the opening brace, then write **in** so that Swift knows the main body of the closure is starting.

import Foundation

let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}


// One difference between functions and closures is that you don't use parameter labels when running closures.
driving("London")
