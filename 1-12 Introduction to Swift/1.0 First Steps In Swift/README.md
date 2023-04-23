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
There are two data types to store fractional numbers. **Float** and **Double**  

The official Apple recommendation is to always use *Double* since it has the most accuracy.  

A Double is short for "double-precision floating-point number" and is used when working with any kind of decimal number.  

Boolean can be either True or False, not both!
```
var pi: Double = 3.141
var awesome: Bool = true
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

Keep in mind that all *Type Anootations* start with a capital letter, while *variable* and *constants* does not. This is standard Swift coding convention.
```
let str: String = "Hello, GitHub"
let language: String = "Swift"
let year: Int = 2014
let version: Double =  5.8
let Awesomeness: Bool = true
```
