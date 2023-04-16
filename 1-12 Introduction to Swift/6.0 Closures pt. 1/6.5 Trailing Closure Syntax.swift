// If the last parameter to a function is a closure, Swift lets you use special syntax called *trailing closure syntax*. Rather than pass in your closure as a parameter, you pass it directly after the function inside the braces.

import Foundation

// This accepts an **action** closure so that it can run between two *print()* calls.
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}


// Because there aren't any other parameters, we can eliminate the parentheses entirely.
travel {
    print("I'm driving in my car")
}
