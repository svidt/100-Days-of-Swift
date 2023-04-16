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
Variables get their name because they can vary. No need to write the 'var' keyword again when changing the same variable.
```
var str = "Hello, GitHub"
str = "Goodbye, GitHub"
```
**1.2 Strings and Integers**  
Strings contains only text-characters incl. numbers - but canot be used for math. Integers are whole numbers and can be multiplied, divided and so on.
```
var greeting = "Hello, GitHub"
var number = 10
var largeNumber = 1_000_000
```
**1.3 Multi-line Strings**  
Text with triple quotes ( """) can show text over multiple lines. While Text with triple quotes along with ( \ ) introduces a line-break.
```
var str1 = """
This text goes
over multiple
lines.
"""
var str2 = """
While this text \
really does go \
over multiple \
lines
"""
```
**1.4 Doubles and Booleans**  
A Double is short for "double-precision floating-point number" and is used when working with any kind of decimal number. Boolean can be either True or False, not both!
```
var pi = 3.141
var awesome = true
```
**1.5 String Interpolation**  
An Interpolation references a previously defined Variable. You can use the same Interpolation as many times as you want.
```
var score = 100
var str = "Your score was \(score)"

var results = "The test results are here: \(score)"
```
**1.6 Constants**  
The "let" keyword defines a Constant. A Constant can never be changed - unlike a Variable.
```
let thisIsAConstant = "and can never be changed"
```
**1.7 Type Annotations**  
Even though Swift is type inferenced - meaning it can figure out at compile time - what type each Constant and Variable is. Sometimes you may want to explicitly define each type.
```
let str: String = "Hello, GitHub"
let language: String = "Swift"
let year: Int = 2014
let version: Double =  5.8
let Awesomeness: Bool = true
```

## 2.0 Complex Data Types  
**2.1 Arrays**  
Arrays are annotated using square brackets " [ ] " and count from 0, meaning the first value in an array is numbered 0 and so on.
Swift crashes if you read an item that doesn't exist - be careful!

```
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]
```
**2.2 Sets**  
Sets are collection of values just like Arrays, except for  two big differences. Number one, Sets store items in no specific order, meaning you can't read an item using numeric positions like you can with an Array. Second, all values must be unique. Any dublicate item will be ignored.
```
let colors = Set(["red", "green", "blue"])
```
**2.3 Tuples**  
Tuples allow you to store several types values together in a single value, very similar to an Array but with three key differences. First, you can't add or remove items from a tuple, a tuple is fixed in size. Second, you can't change the type of item in a typle. Third, you can access items using either numerical posotions or by name. Bonus: You can change the values inside a Tuple, but not it's type of value. Be careful, Swift crashes if you try and read a number or a name that doesn't exsist.
```
var name = (first: "Taylor", last: "Swift")

name.0
name.first
```
**2.4 Arrays vs. Sets. vs. Tuples**  
*Tuple:* If you need a specific- and fixed collection of values, where each item has a precise position and name. *Set:* A collection of values that must be unique and you are able tocheck whether a specific item is in a collection quickly. *Array:* Can contain dublicated and the order of your items matters. Arrays are by far the most common type of these three.
```
// tuple
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
```
```
// set
let set = Set(["aardvark", "astronaut", "azalea"])
```
```
// array
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
```
**2.5 Dictionaries**  
Dictionaries are colection of values just like Arrays. Unlike Arrays - you can access Dictionaries using anything you want. Most commonly using Strings. Dictionaries are seperated with a colon ":" that identifies the "key" or "identifier" to the value stored.
```
let diameterOfUmbrella = [
    "Kids Umbrella": 19,
    "Everyday Umbrella": 25,
    "Golf Umbrella": 34,
    "Beach Umbrella": 60,
    ]

diameterOfUmbrella["Beach Umbrella"]
```
**2.6 Dictionary Default Values**  
If you call an item with no value, Swift is gonna return "nil", but with the "default" keyword, you can tell the program to return any value of the same type, rather than "nil".
```
let favoriteFruit = [
    "Alice": "Cherries",
    "Bob": "Apples",
    ]

diameterOfUmbrella["Space Umbrella", default: 00]
```
**2.7 Creating Empty Collections**
```
// empty dictionary
var teams = [String: String]()
teams["Paul"] = "Red"
```
```
// empty array
var results = [Int]()
```
```
// empty set
var words = Set<String>()
var numbers = Set<Int>()
```
Swift has special syntax for Dictionaries and Arrays, but if you want you could use angle brackets "< >", just like with Sets.
```
var scores = Dictionary<String, Int>()
var results = Array<Int>()
```
**2.8 Enumerations**  
Enumerations - usually just called Enums. Is a way to group related values in a way that makes it easier to use.
```
enum Result {
    case success
    case failure
}

let work = Result.success
```
**2.9 Enum Associated Values**  
Enum associated values let us add additional information.
```
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "cooking")
```
**2.9.1 Enum Raw Values**  
Raw values can sign numbers automatically. However you can also asign specific values and Swift with do the rest.
```
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 3)
```

## 3.0 Operators and Conditions
**3.1 Arithmetic Operators**  
Operators are the mathematical symbols like " + " and " - ", here's an example.
```
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore // addition
let difference = firstScore - secondScore // subtraction

let product = firstScore * secondScore // multiplication
let divided = firstScore / secondScore // division
```
A tricky one to understand is the *Remainder after division*. It calculates how many times a number can fit inside another, then returns the values of what's left. Foe example, we can set *secondScore* to **4**, and do *13 % secondScore*, we will get back **1**, because *4* fits into *13* three times with a remainder of *1*.
```
let remainder = 13 % secondScore
```
**3.2 Operator Overloading**  
Operator overloading means that what an operator does, depends on the values you use it with. For example, " + " can either give you the *sum* of two numbers, or attach two *strings*. Swift is a *type-safe language* which means it won't let you mix types. No adding of strings and integers!
```
let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf
```
**3.3 Compound Assignment Operators**  
Swift has a shortcut for combining one operator with an assignment. They each look like " + , - , * , / " but with an " = " attached to the end them. In the example, *score* 95, *score* -= 5 ( subtracts 5 points and assign it back to the variable *score*. It works on Strings as well.
```
var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"
```
**3.4 Comparison Operators**  
Swift has multiple operators that can perform comparison.
```
let firstScore = 6
let secondScore = 4

firstScore == secondScore // equal to
firstScore != secondScore // not-equal to

firstScore < secondScore // greater than
firstScore >= secondScore // less than, or equal to!
```
Comparison also work on Strings, since there's a natrual alphabetical order.
```
"Taylor" <= "Swift"
```
**3.5 Conditions**  
Conditions are written using *if* statements. Here's an example of drawing two cards: if combined they equal *2* the program prints out "Aces - lucky!", if the combined amount is equal to *21* it says "Blackjack!", otherwise - any other combination returns "Regular cards".
```
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}
```
**3.6 Combining Conditions**  
Swift has two special operators that lets you combine conditions together. " && " meaning **and**, and " || " meaning **or**.
```
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}


if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}
```
**3.7 The Ternary Operator**  
Swift has a rarely used perator called *The Ternary Operator*. It does the comparison inside the *print* statement, followed by a " ? " questions mark, then a " : " colon seperating the first - * if true* and the second - *if false* outcome.
```
let firstCard = 11
let secondCard = 10

print(firstCard == secondCard ? "Cards are the same" : "Cards are different")
```
**3.8 Switch Statements**  
Instead of having a long and complicated * if / else * setup, *Switch Case* offer a more clear overview. The last case - **default** triggers if none of the cases are true.  Swift only run the code inside the case, if you want the execution to contines: use the **fallthrough** keyword.
```
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}
```
**3.9 Range Operators**  
There are two ways of making ranges: the " ..< " and " ... " operators.   The " ..< " creates a range up to but *excluding* the final value.  The " ... " creates a range up to and *including* the final value.
```
let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
```
## 4.1 Loops
**4.1 For Loops**
There are many kinds of loops, but they all have the same underlaying mechanism: run code repeatedly until a condition evaluates as false.  The most common loop in Swift is a *for* loop: it will loop over arrays and ranges, and each time the loop goes around it will pull out one item and assign it to a constant.
```
let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")
```
If you don't want to use the Constant a For Loop gives you, you can use an underscore " _ ".
```
for _ in 1...5 {
    print("play")
}
```
**4.2 While Loops**
A While Loop: give it a condition to check and its loop-code will go around and around until the condition fails.
```
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")
```
**4.3 Repeat Loops**
Repeat loops are not commonly used, but it's simple to learn. It's identical to a *While Loop* except the condition to check comes at the end, meaning it garantees to run the code at least once.
```
var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")
```
**4.4 Exiting Loops**
If you want to exit a loop early, use the **break** keyword.
```
var countDown = 10

while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}
```
**4.5 Exiting Multiple Loops**
When breaking out of multiple loops or nested loops. First you must label the outer loop like this, and then use the **break** keyword along with the name of the outer loop.
```
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}
```
**4.6 Skipping Items**
If you want to skip an item, use the **continue** keyword.  
Remember, the remainder operator figures out how many times the number "2" fits inside each number in our loop, then returns what's left. If 1 is left, it means the number is *odd* and we can use **continue** to skip it.
```
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}
```
**4.7 Infinite Loops**
It's common to use *while loops* to make *infinite loops*, that means a loop that will either never end or only end when you are ready. Here's an example of an infinite loop that just counts upwards - if though; it reaches 273 it breaks out.
```
var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
```

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
First we need to define an **enum** that describes the errors we can throw. These must always be based on Swift's existing *Error Types*.
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
