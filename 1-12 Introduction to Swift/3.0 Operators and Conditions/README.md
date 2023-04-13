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
