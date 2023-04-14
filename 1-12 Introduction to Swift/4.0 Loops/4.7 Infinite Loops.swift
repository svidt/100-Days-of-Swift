// It's common to use *while loops* to make *infinite loops*, that means a loop that will either never end or only end when you are ready. Here's an example of an infinite loop that just counts upwards - if though; it reaches 273 it breaks out.

import Foundation

var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
