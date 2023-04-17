// This time our *travel()* function will require a closure that specifies where someone is traveling to, and the speed they are going. This means wwe need to use **(String, Int) -> String** for the parameter's type.

import Foundation


func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

// You can call this by using a trailing closure and shorthand closure parameter names. Because this accepts two parameters, you will be getting both **$0** and **$1**.
travel {
    "I'm going to \($0) at \($1) miles per hour."
}
