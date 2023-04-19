// If a struct has a variable property bus the instance of the struct was created as a constant, that property can't be changed - the struct is a constant, so all its properties are also constants.

// Swift won't let you write methods that change properties unless you specifically request it.

// Use the keyword **mutating** if you want to change a property inside a method.

import Foundation

struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
