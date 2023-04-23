// Optionals represent data that may or may not be there, but somethings *you* know for sure that a value isn't **nil**. In these cases Swift lets you *force unwrap* - convert it from an optional type to a non-optional type.

// For example, here you know for sure that it is safe and the String "5" can be converted to an integer - BUT if you are wrong, the app will crash. *Force unwrapping* will use the **!** after **Int(str)** - proceed with caution.

let str = "5"
let num = Int(str)!
