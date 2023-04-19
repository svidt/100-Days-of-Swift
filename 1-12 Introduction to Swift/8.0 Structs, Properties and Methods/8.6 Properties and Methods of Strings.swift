// In fact, Strings in itself is a Struct. They have their own methods and properties we can use to query and manipulate the string.


import Foundation

let string = "Do or do not, there is no try."

// Count the number of characters.
print(string.count)

// Checks if the string starts with a ... returns a *bool*.
print(string.hasPrefix("Do"))

// Prints all uppercased.
print(string.uppercased())

// Sorts every letter in an array
print(string.sorted())

// Strings have lots more properties and methods - check out more in Xcode by typing: String, to bring up the code completion options.
