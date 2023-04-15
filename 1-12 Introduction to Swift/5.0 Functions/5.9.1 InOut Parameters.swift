// All parameters passed into a Swift function are *constants*, so they can't be changed. If you want, you can pass in one or more parameters as **inout**, which means they can be changed inside your function.
// Here's an example of doubling a number in place – change the value directly rather than returning a new one.
import Foundation


func doubleInPlace(number: inout Int) {
    number *= 2
}

// First you need to make a *variable* - you can't use *constants* with an **inout**, because they can't be changed. You also need to pass the parameter using an " & " before its name, to explicitly tell that you are aware it is being used as an **inout**.
var myNum = 10
doubleInPlace(number: &myNum)
