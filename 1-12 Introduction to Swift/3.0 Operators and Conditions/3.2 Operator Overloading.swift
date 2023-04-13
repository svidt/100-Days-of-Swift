// Operator overloading means that what an operator does, depends on the values you use it with. For example, " + " can either give you the *sum* of two numbers, or attach two *strings*. Swift is a *type-safe language* which means it won't let you mix types. No adding of strings and integers!

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf
