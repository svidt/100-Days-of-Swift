// Initializer are special Methods that provide different ways to create your Struct. All Structs come with one by default called their *memberwise initializer* - this asks you to provide a value for each property when you create the Struct.

// For example: When we create one of those Structs, we must provide a username.

struct User {
    var username: String

    var user = User(username: "twostraws")
    
    
// You can provide your own initializer to replace the default one. For example you may want to create all new users as "Anonumous" and print a message like this.

// You don't write *func* before initializers, but you do need to to make sure all properties have a value before the initializer ends.
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

// Now that the *initializer* accepts no parameters, you need to create the Struct like this.
var user = User()
user.username = "twostraws"
