// Swift has two special operators that lets you combine conditions together. " && " meaning **and**, and " || " meaning **or**.

import Foundation

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}


if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}
