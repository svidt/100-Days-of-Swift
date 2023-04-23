// An alternative to **if let** is **guard let**, which also unwraps optionals. **guard let** unwraps an optional for you, but if it finds **nil** inside, it expects you to exit the function, loop or condition it's in.
// However, the major difference between **if let** and **guard let** is that your unwrapped optional remains usable after the *guard* code.

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}
