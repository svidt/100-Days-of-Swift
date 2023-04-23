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
Both of following examples are correct. The second are just two characters shorter, and therefore more often used.
```
var songs: [String] = []

var songs = [String]()
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
You often use line-breaks like this to keep everything more readable.
```
var person = [
            "first": "Taylor",
            "last": "Swift",
            "month": "October",
            "year": 2006
            ]

person("first")

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
