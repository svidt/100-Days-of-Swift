// There are many kinds of loops, but they all have the same underlaying mechanism: run code repeatedly until a condition evaluates as false.
// The most common loop in Swift is a *for* loop: it will loop over arrays and ranges, and each time the loop goes around it will pull out one item and assign it to a constant.

import Foundation

let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")


// If you don't want to use the Constant a For Loop gives you, you can use an underscore " _ ".
for _ in 1...5 {
    print("play")
}
