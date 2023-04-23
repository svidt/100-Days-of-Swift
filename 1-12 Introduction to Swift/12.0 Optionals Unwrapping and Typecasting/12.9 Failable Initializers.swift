// A *failable inittializer* is an initializer that might work or might not. You can write these in your own structs and classes by using **init?()** rather than **init()** and return **nil** if something goes wrong.

// The return value will then be an optional of your type, for you to unwrap howevery you want. Here's an example.

struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}
