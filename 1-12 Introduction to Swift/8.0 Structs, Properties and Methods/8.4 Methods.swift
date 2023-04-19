// Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called **Methods**, but they still use the same *func* keyboard.

import Foundation

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

// This method belongs to the struct, so you can call it on instances of the stuct like this.
let london = City(population: 9_000_000)
london.collectTaxes()
