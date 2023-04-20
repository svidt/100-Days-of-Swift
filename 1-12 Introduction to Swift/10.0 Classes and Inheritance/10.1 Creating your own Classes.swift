// Classes are similar to structs in that they allow you to create new types with properties and method, but with five key differences.
// Here's the first 1/5:
// Classes never come with a memberwise initializer. This means if you have properties in your class, you must always create your own initializer.

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
