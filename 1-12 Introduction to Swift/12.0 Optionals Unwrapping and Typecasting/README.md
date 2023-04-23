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
