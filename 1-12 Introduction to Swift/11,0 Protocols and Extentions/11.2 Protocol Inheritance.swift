// One protocol can inherit from another, in a process known as *protocol inheritance*. Unlike with classes, you can inherit from multiple protocols at the same time before adding your own on top.

// Here are 3 protocols, each require conforming types to implement a specific method.

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}


// You can now create a single **Employee** protocol that brings them together in one protocol. You don't need to add anything on top, so just write - open/close braces " { } ".

protocol Employee: Payable, NeedsTraining, HasVacation { }

// Now you can make new types that conform to that single protocol rather than each of the three individual once.
