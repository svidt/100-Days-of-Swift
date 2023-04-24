// Optional Strings might contain a string like "Hello" or they might be *nil* - nothing. Becuase of this, Swift won't allow you to do certain actions on optionals. Therefore you need to *unwrap* before being allowed to use - for instance the **count* property.

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

// If *name* holds a string, it will be put inside the *unwrapped* as a regular string. If *name* is empty, the *else* statement will be run.

