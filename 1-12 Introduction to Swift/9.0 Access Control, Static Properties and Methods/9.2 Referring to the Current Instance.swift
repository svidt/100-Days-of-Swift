// Inside Methods, you get a special constant called **self**, which points to whatever instance of the struct is currently being used. This **self** value is particularly useful when you create initializers that have the same parameter names as your property.

// For example, lets say you create a struct named *Person* with a *name* property, then tried to write an initializer that accepted a *name* parameter, **self** helps you distinguish between the property and the parameter - **self.name** refers to the property, whereas **name** refert to the parameter.

struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

