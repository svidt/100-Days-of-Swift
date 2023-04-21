// Protocols let you describe what methods something could have, but don't provide the code inside. Extentions let you provide the code inside your methods, but only affect one data type.

// Protocol extentions on the other hand, is designed to solve those problems. They are like regular extentions, except rather than extending a specific type like *Int* you extend a whole protocol so that all conforming types get your changes.

// For example, here is an array and a set containing some names:

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])



// Swift's arrays and sets both conform to a protocol called **Collection**, so we can write an extention to that protocol to add **summerize()** method to print the collection neatly.

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}


// Both *Array* and *Set* will now have that method.

pythons.summarize()
beatles.summarize()
