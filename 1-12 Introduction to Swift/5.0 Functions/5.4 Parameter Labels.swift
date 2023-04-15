// Swift lets us provide two names of each parameter: one to be used externally when calling the functions, and one to be used internally inside the function. This is as simple as writing two names seperated by a space.

import Foundation

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")
