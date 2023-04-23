// Earlier you learned *throwing* functions such as **do**, **try** and **catch** to handle errors gracefuly.

// There are two alternatives to **try**. The first is **try?**, and changes *throwing* functions into functions that return an optional. If the function throws an error you'll be send **nil** as the result, otherwise you will get the return value wrapped as an optional.

// Example function from earlier:

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}


// Example using a **try?**:

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

// The other alternative is **try!**, which you can use when you know for sure that the function will *not* fail. If the function *does* throw an error, your code will crash - be careful.

// Example using a **try!**:

try! checkPassword("sekrit")
print("OK!")
