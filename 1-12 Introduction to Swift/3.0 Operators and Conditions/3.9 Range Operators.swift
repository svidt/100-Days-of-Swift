// There are two ways of making ranges: the " ..< " and " ... " operators.   The " ..< " creates a range up to but *excluding* the final value.  The " ... " creates a range up to and *including* the final value.

import Foundation

let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
