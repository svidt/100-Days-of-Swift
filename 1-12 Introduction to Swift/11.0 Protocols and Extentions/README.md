## 11.0 Protocols and Extentions
**11.1 Protocols**  
Protocols are a way of description what properties and methods *must* have. You tell Swift which types use that protocol - known as *adopting* or *conforming* to a protocol.  

Start by creating an **Identifiable** protocol, which will require all conforming types to have an **id** string that can be *read* ( "get" ) or *written* ( "set" ).
```
protocol Identifiable {
    var id: String { get set }
}
```
You *cannot* create instances of a protocol. It's a descrtiption of what you want, rather than something we can create and use directly. But you *can* create a struct that conforms to it.
```
struct User: Identifiable {
    var id: String
}
```
Finally you'll write a **displayID()** function that accepts any **Identifiable** object.
```
func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}
```
**11.2 Protocol Inheritance**  
One protocol can inherit from another, in a process known as *protocol inheritance*. Unlike with classes, you can inherit from multiple protocols at the same time before adding your own on top.  

Here are 3 protocols, each require conforming types to implement a specific method.
```
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}
```
You can now create a single **Employee** protocol that brings them together in one protocol. You don't need to add anything on top, so just write - open/close braces " { } ".
```
protocol Employee: Payable, NeedsTraining, HasVacation { }
```
Now you can make new types that conform to that single protocol rather than each of the three individual once.
**11.3 Extentions**  
Extentions allow you to add methods to existing type, to make them do things they weren't originally designed to do.  

You could add an extention to the **Int** type so that it has a **squared()** method that returns the current number multiplied by it self.
```
extension Int {
    func squared() -> Int {
        return self * self
    }
}
```
To try it out you just create an integer and you'll see it now has a *squared()* method.
```
let number = 8
number.squared()
```
Swift doesn't allow you to add stored properties in extentions, so you must use computed properties instead.
**11.4 Protocol Extenstions**  
Protocols let you describe what methods something could have, but don't provide the code inside. Extentions let you provide the code inside your methods, but only affect one data type.  

Protocol extentions on the other hand, is designed to solve those problems. They are like regular extentions, except rather than extending a specific type like *Int* you extend a whole protocol so that all conforming types get your changes.  

For example, here is an array and a set containing some names:
```
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])
```
Swift's arrays and sets both conform to a protocol called **Collection**, so we can write an extention to that protocol to add **summerize()** method to print the collection neatly.
```
extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
```
Both *Array* and *Set* will now have that method.
```
pythons.summarize()
beatles.summarize()
```
**10.5 Protocol-Oriented Programming**  
Protocol extentions can provide default implementations for our own protocol methods.  

Here's a protocol called **Identifiable** that requires any conforming type to have an **id** property and an **identify()** method.
```
protocol Identifiable {
    var id: String { get set }
    func identify()
}
```
You *could* make every conforming type write their own **identify()** method, but protocol extentions allo you to provide a default.
```
extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}
```
Now when you create a type that conforms to **Identifiable** it gets **identify()** automatically.
```
struct User: Identifiable {
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify()
```
