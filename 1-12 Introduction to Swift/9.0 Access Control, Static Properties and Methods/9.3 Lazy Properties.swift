// As a performance optimization, Swift lets you create some properties only when they are needed. For example, consider this *FamilyTree* Struct - it doesn't do much, but in theory creating a family tree for someone takes a long time.

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}


// You might use the *FamilyTree* Struct as a property inside a *Person* Struct like this.

struct Person {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")


// But what if you don't always need the family tree for a particular person. If you add the **lazy** keyword to the *FamilyTree* property, then Swift will only create the *FamilyTree* Struct when it's first accessed.

struct Person {
    var name: String
    lazy var familyTree = FamilyTree()  // Added the lazy keyword

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")


// If you want to see the "Creating family tree!" message, you need to access the property at least once.

ed.familyTree
