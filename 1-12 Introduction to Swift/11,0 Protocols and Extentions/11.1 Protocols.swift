// Protocols are a way of description what properties and methods *must* have. You tell Swift which types use that protocol - known as *adopting* or *conforming* to a protocol.

// Start by creating an **Identifiable** protocol, which will require all conforming types to have an **id** string that can be *read* ( "get" ) or *written* ( "set" ).
protocol Identifiable {
    var id: String { get set }
}


// You *cannot* create instances of a protocol. It's a descrtiption of what you want, rather than something we can create and use directly. But you *can* create a struct that conforms to it.
struct User: Identifiable {
    var id: String
}


// Finally you'll write a **displayID()** function that accepts any **Identifiable** object.
func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}
