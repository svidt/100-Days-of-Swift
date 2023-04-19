// Access control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly.

// In this example, adding the keyword **private** to the variable *id*, means only methods inside *Person* struct can read the property *id*.

struct Person {
    private var id: String

    init(id: String) {
        self.id = id
    }
}

// Another common option is **public**, which lets all other code use the property or method.
