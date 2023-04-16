// You can pass closures into functions, just like string and integers. But the syntax for this can be very confusing at first.

import Foundation

let driving = {
    print("I'm driving in my car")
}

// If you want to pass a function into a closure so it can be run inside, we need to specify the parameter type as such: **() -> Void**. This means "accepts no parameters and returns *Void*" - Swift's way of saying "nothing".
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

// We can call our *driving* closure like this.
travel(action: driving)
