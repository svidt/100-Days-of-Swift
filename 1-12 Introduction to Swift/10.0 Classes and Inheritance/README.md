## 10.0 Classes and Inheritance
**10.1 Creating your own Classes**  
Classes are similar to structs in that they allow you to create new types with properties and method, but with five key differences.  

Here's the first 1/5:  
Classes never come with a memberwise initializer. This means if you have properties in your class, you must always create your own initializer.
```
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
```
**10.2 Class Inheritance**  
The second difference between classes and structs 2/5 - is that you can create a class based on an existing class - it inherits all the properties and methods of the original class, and you can add its own on top.
```
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
```
This is called *class inheritance* or *subclassing*, the class you inherit from is called the "parent" or "super" class, and the new class is called the "child" class.  

Here you create a new class called *Poodle*, and it wil inherit the same properties and initializers as *Dog*.
```
class Poodle: Dog {

}
```
You can even give *Poodle* its own initializer, and it can even initialize call the *Dog* initializer directly.  

For safety reasons, Swift always makes you call **super.init()** from child classes - just in case the parent class does something important when it's first created.
```
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}
```
**10.3 Overriding Methods**  
Child classes can replace parent methods with their own implementations - a process known as *overriding*. Here's a new *Dog* class with *makeNoise()* method.
```
class Dog {
    func makeNoise() {
        print("Woof!")
    }
}
```
If you create a new *Poodle* class that inherits from *Dog*, it will inherit the *makeNoise()* methods and print "Woof!".
```
class Poodle: Dog {
}

let poppy = Poodle()
poppy.makeNoise()
```
Method overriding allows us to change the implementation of *makeNoise()* for the *Poodle* class.  

Swift requires you to use **override func** rather than just **func** when overriding a method - it stops you from overriding a method by acident.
```
class Poodle: Dog {
    override func makeNoise() {
        print("Yip!")
    }
}
```
**10.4 Final Classes**  
Although class inheritance is very useful - sometimes you want to disallow other developers form building their own classes based on yours.  

Swift gives you a **final** keyword just for this purpose. When you declare a class as being final, no other class can inherit from it.
```
final class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
```
**10.5 Copying Objects**  
The third 3/5 difference between classes and structs, is how they are copied. You can copy a struct, both the original and the copy are different things - changing one won't affect the other.  

When you copy a *class* though, both the original and the copy points to the same thing, so changing one *does* change the other.
```
class Singer {
    var name = "Taylor Swift"
}
```
The following creates an instance of the class *Singer()* and print its name.
```
var singer = Singer()
print(singer.name)
```
Now if we craete a second variable from the first and change its name.
```
var singerCopy = singer
singerCopy.name = "Justin Bieber"
```
Because of the way classes work, both *singer* and *singerCopy* points to the same block in memory, so printing the singer name again; you'll see "Justin Bieber".
```
print(singer.name)
```
This wouldn't have been the case if *Singer* were a struct.
**10.6 Deinitializers**  
The forth difference 4/5, is that classes can have *deinitializers* - code that gets run when an instance of a class is destroyed.  

For example, here's a class named *Person* with one *name* property, an initiliazer and a *printGreeting()* method.
```
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}
```
A simple loop that will create a few instances of *Person*. Each time the loop goes around, a new person will be created then destroyed.
```
for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}
```
The **deinit** deinitializer, this will be called when the *Person* instance is being destroyed.
```
deinit {
    print("\(name) is no more!")
}
```
**10.7 Mutability**  
The final difference between classs and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can't be changed because the struct itself is constant.  

If however you have a constant *class* with a variable property, that property *can* be changed. Because of this, classes don't need the **mutating** keyword, as *structs* would need.
```
class Singer {
    var name = "Taylor Swift"
}

let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)
```
If you want to stop this change from happening, you need to make the property *constant*, using the **let** keyword instead.
```
class Singer {
    let name = "Taylor Swift"
}
```
