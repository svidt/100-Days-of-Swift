// If you use any external values inside your closure, Swift captures them - store them alongside the closure, so they can be modified even if they don't exist any more.

import Foundation

// Here we have a *travel()* function that returns a closure, and the returned closure accepts a string as its only parameter and returns nothing.
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

//You can call *travel()* to get back the closure, then call that closure freely.
let result = travel()
result("London")

//Closure capturing happens if you create values in *travel()* that get used inside the closure. For example, you might want to track how often the returned closure is called.
func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

// Even though that **counter** variable was created inside *travel()*, it gets captured by the closure so it will still remain alive for that closure.
//You can call **result("London")** multiple times, the counter will go up and up.
result("London")
result("London")
result("London")
