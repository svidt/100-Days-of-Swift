// Child classes can replace parent methods with their own implementations - a process known as *overriding*. Here's a new *Dog* class with *makeNoise()* method.

class Dog {
    func makeNoise() {
        print("Woof!")
    }
}

// If you create a new *Poodle* class that inherits from *Dog*, it will inherit the *makeNoise()* methods and print "Woof!".

class Poodle: Dog {
}

let poppy = Poodle()
poppy.makeNoise()

// Method overriding allows us to change the implementation of *makeNoise()* for the *Poodle* class.

// Swift requires you to use **override func** rather than just **func** when overriding a method - it stops you from overriding a method by acident.

class Poodle: Dog {
    override func makeNoise() {
        print("Yip!")
    }
}
