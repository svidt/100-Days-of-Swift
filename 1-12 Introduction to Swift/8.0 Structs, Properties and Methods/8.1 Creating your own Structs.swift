// In Swift you can make your own *types*. One way is called *Structures* or just *Structs*. They can be given their own variable, constants and even functions. Variables inside a struct are called *properties*. This is a struct with one property.

import Foundation

struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

// It can be changed like any other variable.
tennis.name = "Lawn tennis"
