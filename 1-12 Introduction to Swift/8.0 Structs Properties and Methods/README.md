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
