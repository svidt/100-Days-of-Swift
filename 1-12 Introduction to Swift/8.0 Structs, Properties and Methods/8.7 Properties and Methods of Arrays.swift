// Arrays are also structs. Which means they too have their own methods and properties - just like strings.

import Foundation

var toys = ["Woody"]

// Read the number of items in an array.
print(toys.count)

// Adding a new item to the end of the array.
toys.append("Buzz")

// Locate any item inside an array.
toys.firstIndex(of: "Buzz")

// Sort the items alphabetically.
print(toys.sorted())

// Removing an item from the array at index:() .
toys.remove(at: 0)
