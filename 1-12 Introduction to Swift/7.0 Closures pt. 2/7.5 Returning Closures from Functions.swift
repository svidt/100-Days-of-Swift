// In the same way that you can pass a closure *to* a function, you can get closures returned *from* a function too. The syntax is a bit different because it uses **->** twice, once to specify the function's return value, and a second time to specify your closure's return value.

import Foundation

func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

// You can call *travel()* to get back that closure, then call it as a function.
let result = travel()
result("London")

// It's technically allowable - although really not recommended - to call the return value from *travel()* directly.
let result2 = travel()("London")
