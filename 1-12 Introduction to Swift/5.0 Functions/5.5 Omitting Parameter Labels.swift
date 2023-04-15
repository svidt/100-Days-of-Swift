// By using an underscore " _ " as your external paramter name, we can avoid having to send any parameter name - just like the function: *print("Hello, GitHub!")*. Be careful, as it can make your code less readable.

import Foundation

func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")
