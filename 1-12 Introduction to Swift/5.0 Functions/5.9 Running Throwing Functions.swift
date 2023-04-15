// Swift doesn't like errors to happen when your program runs, that means it won't let you run an error-throwing function by accident.
// Here are three new keywords: *do* starts a section of code that might cause problems. *try* is used before every function that might throw an error. *catch* lets you handle errors gracefully.
// If any errors are thrown inside the *do* code-block, execution immediately jumps to the *catch* block.

import Foundation

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
