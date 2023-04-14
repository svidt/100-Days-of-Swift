// When breaking out of multiple loops or nested loops. First you must label the outer loop like this, and then use the **break** keyword along with the name of the outer loop.

import Foundation

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
