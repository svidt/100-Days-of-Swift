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
