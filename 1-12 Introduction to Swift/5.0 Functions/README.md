## 5.0 Functions

**5.1 Writing Functions**  
Functions let you re-use code, which means we can write a function to do something interesting, then run that function from multiple places within your code. Repeating code is generally a bad idea, and functions can help us avoid that. Running a Function is often refered to as *calling* a Function.
```
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}

printHelp()
```

**5.2 Accepting Parameters**  
Functions become much more powerful when they can be customized each time you run them. That's where Parameters come in, you can make your Funtion in a way so they accept an input and take that input into consideration when you run them.  You do this by; using the *func* keyword, then the name of the function, then brackets " ( ) ", then the name of the parameter and finally define what type of input it should expect.
```
func square(number: Int) {
    print(number * number)
}
```
**5.3 Returning Values**  
As well as recieving data, a function can also send back data. In order to do this, put " -> " after your function's parameter, then say what type of data to be returned.  Inside your function use the **return** keyword to send a value back. Your function then immediately exits - no other code from that function will be run.
```
func square(number: Int) -> Int {
    return number * number
}
```
We can also grab the returned value, and print it using the *print* function.
```
let result = square(number: 8)
print(result)
```
**5.4 Parameter Labels**  
Swift lets us provide two names of each parameter: one to be used externally when calling the functions, and one to be used internally inside the function. This is as simple as writing two names seperated by a space.
```
func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")
```
**5.5 Omitting Parameter Labels**  
By using an underscore " _ " as your external paramter name, we can avoid having to send any parameter name - just like the function: *print("Hello, GitHub!")*. Be careful, as it can make your code less readable.
```
func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")
```
**5.6 Default Parameters**  
Just as the *print()* function always adds a newline to the end - it too allows you to use spaces- or anything else, rather than line breaks.  Using the *terminator* parameter permits you to change this.
```
print("hello", terminator: " ")
```
You can write a function like this.
```
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
```
You can call this function in two ways.
```
greet("Taylor")
greet("Taylor", nicely: false)
```
**5.7 Variadic Functions**  
Some functions are *variadic* which is a fancy way of saying they accept any number of parameters of the same type. You can make any function *variadic* by writing " ... " after its type.
```
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)
```
**5.8 Writing Throwing Functions**  
Sometimes functions fail because they have bad input, or perhaps something went wrong internally. Swift lets you throw errors from functions by marking them as *throws* before their return type.  
First we need to define an **enum** that describes the errors we can throw. These must always be based on Swift's existing *Error Types*
```
enum PasswordError: Error {
    case obvious
}
```
Now you will write a *checkPassword()* function that will throw that error if something goes wrong.
```
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}
```
**5.9 Running Throwing Functions**  
Swift doesn't like errors to happen when your program runs, that means it won't let you run an error-throwing function by accident.  
Here are three new keywords: *do* starts a section of code that might cause problems. *try* is used before every function that might throw an error. *catch* lets you handle errors gracefully.  
if any errors are thrown inside the *do* code-block, execution immediately jumps to the *catch* block.
```
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
```
**5.9.1 InOut Parameters**  
All parameters passed into a Swift function are *constants*, so they can't be changed. If you want, you can pass in one or more parameters as **inout**, which means they can be changed inside your function.  
Here's an example of doubling a number in place – change the value directly rather than returning a new one.
```
func doubleInPlace(number: inout Int) {
    number *= 2
}
```
First you need to make a *variable* - you can't use *constants* with an **inout**, because they can't be changed. You also need to pass the parameter using an " & " before its name, to explicitly tell that you are aware it is being used as an **inout**.
```
var myNum = 10
doubleInPlace(number: &myNum)

```
