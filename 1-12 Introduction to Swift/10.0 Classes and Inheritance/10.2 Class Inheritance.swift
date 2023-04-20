// The second difference between classes and structs 2/5 -
// is that you can create a class based on an existing class - it inherits all the properties and methods of the original class, and you can add its own on top.

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// This is called *class inheritance* or *subclassing*, the class you inherit from is called the "parent" or "super" class, and the new class is called the "child" class.


// Here you create a new class called *Poodle*, and it wil inherit the same properties and initializers as *Dog*.
class Poodle: Dog {

}


// You can even give *Poodle* its own initializer, and it can even initialize call the *Dog* initializer directly.

// For safety reasons, Swift always makes you call **super.init()** from child classes - just in case the parent class does something important when it's first created.

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}
