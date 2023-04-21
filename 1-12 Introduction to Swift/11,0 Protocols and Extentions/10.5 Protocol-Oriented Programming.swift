// Protocol extentions can provide default implementations for our own protocol methods.

// Here's a protocol called **Identifiable** that requires any conforming type to have an **id** property and an **identify()** method.

protocol Identifiable {
    var id: String { get set }
    func identify()
}


// You *could* make every conforming type write their own **identify()** method, but protocol extentions allo you to provide a default.

extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}



//Now when you create a type that conforms to **Identifiable** it gets **identify()** automatically.
struct User: Identifiable {
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify()
