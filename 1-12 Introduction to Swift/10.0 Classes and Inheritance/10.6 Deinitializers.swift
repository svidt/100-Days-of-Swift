// The forth difference 4/5, is that classes can have *deinitializers* - code that gets run when an instance of a class is destroyed.

// For example, here's a class named *Person* with one *name* property, an initiliazer and a *printGreeting()* method.
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}

// A  simple loop that will create a few instances of *Person*. Each time the loop goes around, a new person will be created then destroyed.
for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// The **deinit** deinitializer, this will be called when the *Person* instance is being destroyed.
deinit {
    print("\(name) is no more!")
}
