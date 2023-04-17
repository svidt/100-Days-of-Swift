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
