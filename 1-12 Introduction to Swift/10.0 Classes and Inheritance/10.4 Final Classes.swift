// Although class inheritance is very useful - sometimes you want to disallow other developers form building their own classes based on yours.

// Swift gives you a **final** keyword just for this purpose. When you declare a class as being final, no other class can inherit from it.

final class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
