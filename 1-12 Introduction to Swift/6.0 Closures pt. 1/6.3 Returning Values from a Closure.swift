// Closures can also return values, and they are written similary to parameters - you write them inside your closure directly before the **in** keyword.  For example here the *drivingWithReturn()* function returns its value rather than printing it directly. Use " -> " *String* before the **in** keyword, the use **return**.

import Foundation

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

