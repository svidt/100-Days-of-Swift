// Sometimes functions fail because they have bad input, or perhaps something went wrong internally. Swift lets you throw errors from functions by marking them as *throws* before their return type.

// First we need to define an **enum** that describes the errors we can throw. These must always be based on Swift's existing *Error Types*
enum PasswordError: Error {
    case obvious
}

// Now you will write a *checkPassword()* function that will throw that error if something goes wrong.
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}
