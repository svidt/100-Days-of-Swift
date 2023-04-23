# 100 Days of Swift
2023 Svidt – 
A repository for my personal journey through @twostraws 100 Days of Swift® - 
[Website](https://www.hackingwithswift.com/100)

**1 - 12 : [Introduction To Swift](/1-12%20Introduction%20to%20Swift/)**  
**13 - 15 : Consolidation I**  
**16 - 22 : Starting iOS**  
**23 : Consolidation II**  
**24 - 31 : Web views, user input, and Auto Layout**  
**32 : Consolidation III**  
**33 - 40 : Codable, buttons, and GCD**  
**41 : Consolidation IV**  
**42 - 49 : A whole new world**  
**50 - 51 : Consolidation V**  
**52 - 58 : Images and animation**  
**59 : Consolidation VI**  
**60 - 65 : Maps and bugs**  
**66 : Consolidation VII**  
**67 - 73 : Leveling up**  
**74 : Consolidation VIII**  
**75 - 81 : Beacons and bombs**  
**82 : Consolidation IX**  
**83 - 89 : Multipeer and motion**  
**90 - 91 : Consolidation X**  
**92 - 98 : The Final Countdown**  
**99 : Consolidation XI**  
**100 : Final Exam**  

## 1.0 First Steps In Swift
**1.1 Variables**  
**1.2 Strings and Integers**  
**1.3 Multi-line Strings**  
**1.4 Doubles and Booleans**  
**1.5 String Interpolation**  
**1.6 Constants**  
**1.7 Type Annotations**  

## 2.0 Complex Data Types  
**2.1 Arrays**  
**2.2 Sets**  
**2.4 Arrays vs. Sets. vs. Tuples**  
**2.5 Dictionaries**  
**2.6 Dictionary Default Values**  
**2.7 Creating Empty Collections**
**2.8 Enumerations**  
**2.9 Enum Associated Values**  
**2.9.1 Enum Raw Values**  

## 3.0 Operators and Conditions
**3.1 Arithmetic Operators**  
**3.2 Operator Overloading**  
**3.3 Compound Assignment Operators**  
**3.4 Comparison Operators**  
**3.5 Conditions**  
**3.6 Combining Conditions**  
**3.7 The Ternary Operator**  
**3.8 Switch Statements**  
**3.9 Range Operators**  

## 4.1 Loops
**4.1 For Loops**
**4.2 While Loops**
**4.3 Repeat Loops**
**4.4 Exiting Loops**
**4.5 Exiting Multiple Loops**
**4.6 Skipping Items**
**4.7 Infinite Loops**

## 5.0 Functions
**5.1 Writing Functions**  
**5.2 Accepting Parameters**  
**5.3 Returning Values**  
**5.4 Parameter Labels**  
**5.5 Omitting Parameter Labels**  
**5.6 Default Parameters**  
**5.7 Variadic Functions**  
**5.8 Writing Throwing Functions**  
**5.9 Running Throwing Functions**  
**5.9.1 InOut Parameters**  

## 6.0 Closures pt. 1
**6.1 Creating Basic Closures**
Swift lets you use functions just like any other type such as strings or integers. This means you can create a function and assign it to a variable, call that function, and even pass that function into other functions as parameters.  
Functions used in this way are called *Closures* and although they work like functions they are written a little differently.
```
let driving = {
    print("I'm driving in my car")
}

driving()
```
**6.2 Accepting Parameters in a Closure**
To make a closure accept parameters, list them inside parentheses just after the opening brace, then write **in** so that Swift knows the main body of the closure is starting.  
```
let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}
```
One difference between functions and closures is that you don't use parameter labels when running closures.  
```
driving("London")
```
**6.3 Returning Values from a Closure**
Closures can also return values, and they are written similary to parameters - you write them inside your closure directly before the **in** keyword.  For example here the *drivingWithReturn()* function returns its value rather than printing it directly. Use " -> " *String* before the **in** keyword, the use **return**.  
```
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)
```
**6.4 Closures as Parameters**
You can pass closures into functions, just like string and integers. But the syntax for this can be very confusing at first.  
```
let driving = {
    print("I'm driving in my car")
}
```
If you want to pass a function into a closure so it can be run inside, we need to specify the parameter type as such: **() -> Void**. This means "accepts no parameters and returns *Void*" - Swift's way of saying "nothing".  
```
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
```
We can call our *driving* closure like this.
```
travel(action: driving)
```
**6.5 Trailing Closure Syntax**
If the last parameter to a function is a closure, Swift lets you use special syntax called *trailing closure syntax*. Rather than pass in your closure as a parameter, you pass it directly after the function inside the braces.  

This accepts an **action** closure so that it can run between two *print()* calls.
```
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
```
Because there aren't any other parameters, we can eliminate the parentheses entirely.
```
travel {
    print("I'm driving in my car")
}
```

## 7.0 Closures pt. 2
**7.1 Using Closures as Parameters - Accept Parameters**
This time instead of using " () -> Void " which means "accepting no parameters and returns nothing" - as we have done earlier. Now we can fill the " ( ) ". To demonstrate this, we can write a *travel()* function that accepts a closure as its only parameter and that closure in turn accepts a *string*.
```
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}
```
We now call *travel()* using trailing closure syntax, the closure code is required to accept a *string*.
```
travel { (place: String) in
    print("I'm going to \(place) in my car")
}
```
**7.2 Using Closures as Parameters - Return Values**
You can replace *Void* with any type of data to force the closure to return a value. Let's rewrite the *travel()* function so that it accepts a closure as its only parameter and that closure in turn accepts a string and returns a string.
```
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
```
You call the *travel()* function using trailing closure syntax, the closure code is required to accept a string and return a string.
```
travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
```
**7.3 Shorthand Parameter Names**
This *travel()* function accepts one parameter, which is a closure that in itself accepts one parameter and returns a string. That closure is then run between two *print()* calls.
```
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
```
Here's how you would call this closure.
```
travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
```
Now lets see how short we can make it. Swift knows the parameter to that closure must be a string, so we can remove it.
```
travel { place -> String in
    return "I'm going to \(place) in my car"
}
```
Swift also knows the closure must return a string, so we can remove that as well.
```
travel { place in
    return "I'm going to \(place) in my car"
}
```
Lastly, as the closure only has one line of code, that must be the one that returns the value, so Swift lets us remove the *return* keyword too.
```
travel { place in
    "I'm going to \(place) in my car"
}
```
BONUS: Swift has a shorthand syntax that lets you go even shorter. Rather than writing *place in* we can let Swift provide automatic names for the closure's parameters. These are named with a dollar sign ( $ ), then a number counting from 0.
```
travel {
    "I'm going to \($0) in my car"
}
```
**7.4 Closures with Multiple Parameters**
This time our *travel()* function will require a closure that specifies where someone is traveling to, and the speed they are going. This means wwe need to use **(String, Int) -> String** for the parameter's type.
```
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
```
You can call this by using a trailing closure and shorthand closure parameter names. Because this accepts two parameters, you will be getting both **$0** and **$1**.
```
travel {
    "I'm going to \($0) at \($1) miles per hour."
}
```
**7.5 Returning Closures from Functions**
In the same way that you can pass a closure *to* a function, you can get closures returned *from* a function too. The syntax is a bit different because it uses **->** twice, once to specify the function's return value, and a second time to specify your closure's return value.
```
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
```
You can call *travel()* to get back that closure, then call it as a function.
```
let result = travel()
result("London")
```
It's technically allowable - although really not recommended - to call the return value from *travel()* directly.
```
let result2 = travel()("London")
```

**7.6 Capture Values**
If you use any external values inside your closure, Swift captures them - store them alongside the closure, so they can be modified even if they don't exist any more.  
Here we have a *travel()* function that returns a closure, and the returned closure accepts a string as its only parameter and returns nothing.
```
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
```
You can call *travel()* to get back the closure, then call that closure freely.
```
let result = travel()
result("London")
```
Closure capturing happens if you create values in *travel()* that get used inside the closure. For example, you might want to track how often the returned closure is called.
```
func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
```
Even though that **counter** variable was created inside *travel()*, it gets captured by the closure so it will still remain alive for that closure.  
You can call **result("London")** multiple times, the counter will go up and up.
```
result("London")
result("London")
result("London")
```

## 8.0 Structs, Properties and Methods
**8.1 Creating your own Structs**
In Swift you can make your own *types*. One way is called *Structures* or just *Structs*. They can be given their own variable, constants and even functions. Variables inside a struct are called *properties*. This is a struct with one property.
```
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)
```
It can be changed like any other variable.
```
tennis.name = "Lawn tennis"
```
**8.2 Computed Properties**
Swift has a different kind of property called a *computed* property - a property that runs code to figure out its value.  

You can see that *olympicStatus* looks like a regular String, but it returns different values depending on the other properties.
```
struct Sport {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
```
You can try this out by creating a new instance of *Sport*.
```
let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)
```
**8.3 Property Observers**
Property observers let you run code before or after any property changes. To demonstrate this, here's a *Progress* struct that tracks a task and a completion percentage.  

Here Swift will print a message every time *amount* changes, and we can use a *didSet* property observer for that. This will run its code every time *amount* changes.
```
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100
```
You can also use *willSet* to take action before a property changes, but that is rarely used.
**8.4 Methods**
Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called **Methods**, but they still use the same *func* keyboard.
```
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
```
This method belongs to the struct, so you can call it on instances of the stuct like this.
```
let london = City(population: 9_000_000)
london.collectTaxes()
```
**8.5 Mutating Methods**
If a struct has a variable property bus the instance of the struct was created as a constant, that property can't be changed - the struct is a constant, so all its properties are also constants.  

Swift won't let you write methods that change properties unless you specifically request it.  

Use the keyword **mutating** if you want to change a property inside a method.
```
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
```
**8.6 Properties and Methods of Strings**
In fact, Strings in itself is a Struct. They have their own methods and properties we can use to query and manipulate the string.
```
let string = "Do or do not, there is no try."
```
Count the number of characters.
```
print(string.count)
```
Checks if the string starts with a ... returns a *bool*.
```
print(string.hasPrefix("Do"))
```
Prints all uppercased.
```
print(string.uppercased())
```
Sorts every letter in an array
```
print(string.sorted())
```
Strings have lots more properties and methods - check out more in Xcode by typing: String, to bring up the code completion options.
**8.7 Properties and Methods of Arrays**
Arrays are also structs. Which means they too have their own methods and properties - just like strings.
```
var toys = ["Woody"]
```
Read the number of items in an array.
```
print(toys.count)
```
Adding a new item to the end of the array.
```
toys.append("Buzz")
```
Locate any item inside an array.
```
toys.firstIndex(of: "Buzz")
```
Sort the items alphabetically.
```
print(toys.sorted())
```
Removing an item from the array at index:() .
```
toys.remove(at: 0)
```

## 9.0 Access Control, Static Properties and Methods
**9.1 Initializers**  
Initializer are special Methods that provide different ways to create your Struct. All Structs come with one by default called their *memberwise initializer* - this asks you to provide a value for each property when you create the Struct.  

For example: When we create one of those Structs, we must provide a username.
```
struct User {
    var username: String
}
    var user = User(username: "twostraws")
```  
You can provide your own initializer to replace the default one. For example you may want to create all new users as "Anonumous" and print a message like this.  

You don't write *func* before initializers, but you do need to to make sure all properties have a value before the initializer ends.
```
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
```
Now that the *initializer* accepts no parameters, you need to create the Struct like this.
```
var user = User()
user.username = "twostraws"
```
**9.2 Referring to the Current Instance**  
Inside Methods, you get a special constant called **self**, which points to whatever instance of the struct is currently being used. This **self** value is particularly useful when you create initializers that have the same parameter names as your property.  

For example, lets say you create a struct named *Person* with a *name* property, then tried to write an initializer that accepted a *name* parameter, **self** helps you distinguish between the property and the parameter - **self.name** refers to the property, whereas **name** refert to the parameter.
```
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}
```
**9.3 Lazy Properties**  
As a performance optimization, Swift lets you create some properties only when they are needed. For example, consider this *FamilyTree* Struct - it doesn't do much, but in theory creating a family tree for someone takes a long time.
```
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}
```
You might use the *FamilyTree* Struct as a property inside a *Person* Struct like this.
```
struct Person {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")
```
But what if you don't always need the family tree for a particular person. If you add the **lazy** keyword to the *FamilyTree* property, then Swift will only create the *FamilyTree* Struct when it's first accessed.
```
struct Person {
    var name: String
    lazy var familyTree = FamilyTree()  // Added the lazy keyword

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")
```
If you want to see the "Creating family tree!" message, you need to access the property at least once.
```
ed.familyTree
```
**9.4 Static Properties and Methods**  
So far all properties and methods you have created all belong to individual instances of a struct, which means that if you had a *Student* struct you could create several student instances - each with their own properties and methods.  

Here you can ask Swift to share specific properties and methods across all instances of the struct by declaring them as **static**.  

For example, let's add a **static** property to the *Student* struct to store how many students are in the class. Each time you create a new student, the struct will add one to it.
```
struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
```
Because the *classSize* property belongs to the struct itself rather than instances of the struct, you need to read it using **Student.classSize**.
```
print(Student.classSize)
```
**9.5 Access Controll**  
Access control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly.  

In this example, adding the keyword **private** to the variable *id*, means only methods inside *Person* struct can read the property *id*.
```
struct Person {
    private var id: String

    init(id: String) {
        self.id = id
    }
}
```
Another common option is **public**, which lets all other code use the property or method.

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

## 12.0 Optionals, Unwrapping and Typecasting
**12.1 Handling Missing Data**  
**Int** is used to hold numbers like 5, but if you want to store an *age* property for users, what would you do if you didn't know someone's age?  

For this, Swift has a solution called *optionals*, and you can make optionals out of *any* type. An optional integer might have a number like 5 or 40, but it might also have no value - it might acutally be missing, which is **nil**.
```
var age: Int? = nil
```
Until now, the variable **age** doesn't hold any number. But you can add one later in the process, like this.
```
age = 38
```
**12.2 Unwrapping Optionals**  
Optional Strings might contain a string like "Hello" or they might be *nil* - nothing. Becuase of this, Swift won't allow you to do certain actions on optionals. Therefore you need to *unwrap* before being allowed to use - for instance the **count* property.
```
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}
```
If *name* holds a string, it will be put inside the *unwrapped* as a regular string. If *name* is empty, the *else* statement will be run.
**12.3 Unwrapping With Guard**  
An alternative to **if let** is **guard let**, which also unwraps optionals. **guard let** unwraps an optional for you, but if it finds **nil** inside, it expects you to exit the function, loop or condition it's in.  

However, the major difference between **if let** and **guard let** is that your unwrapped optional remains usable after the *guard* code.
```
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}
```
**12.4 Force Unwrapping**  
Optionals represent data that may or may not be there, but somethings *you* know for sure that a value isn't **nil**. In these cases Swift lets you *force unwrap* - convert it from an optional type to a non-optional type.  

For example, here you know for sure that it is safe and the String "5" can be converted to an integer - BUT if you are wrong, the app will crash. *Force unwrapping* will use the **!** after **Int(str)** - proceed with caution.
```
let str = "5"
let num = Int(str)!
```
**12.5 Implicitly Unwrapped Optionals**  
*Implicitly unwrapped optionals* might contain a value or they might be **nil**. However, unlike like regular optionals you don't need to unwrap them in order to use them. You can use them as if they weren't optionals in the first place - if it turns out that they are in fact **nil** your app still crashes - Be cautious.  

The upside is that you don't need **if let** or **guard let** to unwrap your *implicitly unwrapped optionals*.  

*Implicitly unwrapped optionals* are created by adding an exclamation mark " ! " after your type name.
```
let age: Int! = nil
```
**12.6 Nil Coalescing**  
The *nil coalescing* operator unwraps an optional and returns the value inside if there is one. If there isn't a value - the optional was *nil* - then a default value is used instead. Either way, the result won't be an optional; it will either be the original value inside, or the default value used as a backup.
```
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
```
If we call this function using for example "15", we will get back **nil** becuase the user isn't recognized. But with *nil coalescing* we can provide a default value of "Anonymous" like this:
```
let user = username(for: 15) ?? "Anonymous"
```
**12.7 Optionals Chaining**  
Swift provides a shortcut when using optionals: if you want to access something like **a.b.c** and **b** is an optional, you can write **a.b?.c**. This is called *Optional Chaining*.  

When this code runs, Swift will check whether **b** has a value or if it's **nil**. If it's **nil** the rest of the line will be ignored and return **nil** immediately. Otherwise execution will continue if it *has* a value.
```
let names = ["John", "Paul", "George", "Ringo"]
```
The question mark " ? " is *Optional Chaining* - if **first** returns **nil** the Swift won't try to uppercase it and **beatle** will be set to **nil**. As this *isn't* the case here, all properties are executed - and we get "JOHN" returned.
```
let beatle = names.first?.uppercased()
```
**12.8 Optional Try**  
Earlier you learned *throwing* functions such as **do**, **try** and **catch** to handle errors gracefuly.  

There are two alternatives to **try**. The first is **try?**, and changes *throwing* functions into functions that return an optional. If the function throws an error you'll be send **nil** as the result, otherwise you will get the return value wrapped as an optional.  

Example function from earlier:
```
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
```
Example using a **try?**:
```
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}
```
The other alternative is **try!**, which you can use when you know for sure that the function will *not* fail. If the function *does* throw an error, your code will crash - be careful.  

Example using a **try!**:
```
try! checkPassword("sekrit")
print("OK!")
```
**12.9 Failable Initializers**  
A *failable inittializer* is an initializer that might work or might not. You can write these in your own structs and classes by using **init?()** rather than **init()** and return **nil** if something goes wrong.  

The return value will then be an optional of your type, for you to unwrap howevery you want. Here's an example.
```
struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}
```
**12.9.1 Typecasting**  
Swift must always know the type of each of your variables, but sometimes you know more information than Swift does. For example, here are three classes.
```
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
```
Here are a couple of fish- and a couple of dogs-objects in an array.
```
let pets = [Fish(), Dog(), Fish(), Dog()]
```
Swift knows all *pets[]* inherit from the *Animal* class. But if you want to loop through all objects in the array and only make the dogs bark, do like this.
```
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
```
This uses the keyword **as?**, which returns an optional: it will be **nil** if the typecast failed - otherwise a converted type.
