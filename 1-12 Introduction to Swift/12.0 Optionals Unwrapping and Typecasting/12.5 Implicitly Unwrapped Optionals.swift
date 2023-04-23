// *Implicitly unwrapped optionals* might contain a value or they might be **nil**. However, unlike like regular optionals you don't need to unwrap them in order to use them. You can use them as if they weren't optionals in the first place - if it turns out that they are in fact **nil** your app still crashes - Be cautious.
// The upside is that you don't need **if let** or **guard let** to unwrap your *implicitly unwrapped optionals*.

// *Implicitly unwrapped optionals* are created by adding an exclamation mark " ! " after your type name.

let age: Int! = nil
