// Swift provides a shortcut when using optionals: if you want to access something like **a.b.c** and **b** is an optional, you can write **a.b?.c**. This is called *Optional Chaining*.

// When this code runs, Swift will check whether **b** has a value or if it's **nil**. If it's **nil** the rest of the line will be ignored and return **nil** immediately. Otherwise execution will continue if it *has* a value.

let names = ["John", "Paul", "George", "Ringo"]


// The question mark " ? " is *Optional Chaining* - if **first** returns **nil** the Swift won't try to uppercase it and **beatle** will be set to **nil**. As this *isn't* the case here, all properties are executed - and we get "JOHN" returned.

let beatle = names.first?.uppercased()
