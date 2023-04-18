// Property observers let you run code before or after any property changes. To demonstrate this, here's a *Progress* struct that tracks a task and a completion percentage.

// Here Swift will print a message every time *amount* changes, and we can use a *didSet* property observer for that. This will run its code every time *amount* changes.

import Foundation

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// You can also use *willSet* to take action before a property changes, but that is rarely used.
