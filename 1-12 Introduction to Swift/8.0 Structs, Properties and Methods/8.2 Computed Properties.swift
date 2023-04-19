// Swift has a different kind of property called a *computed* property - a property that runs code to figure out its value.

import Foundation

// You can see that *olympicStatus* looks like a regular String, but it returns different values depending on the other properties.
struct Sport {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}


// You can try this out by creating a new instance of *Sport*.
let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)
