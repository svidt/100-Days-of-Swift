## 9.0 Access Control, Static Properties and Methods
**9.1 Initializers**  
Initializer are special Methods that provide different ways to create your Struct. All Structs come with one by default called their *memberwise initializer* - this asks you to provide a value for each property when you create the Struct.  

For example: When we create one of those Structs, we must provide a username.
```
struct User {
    var username: String
}
    var user = User(username: "twostraws")
```  
You can provide your own initializer to replace the default one. For example you may want to create all new users as "Anonumous" and print a message like this.  

You don't write *func* before initializers, but you do need to to make sure all properties have a value before the initializer ends.
```
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
```
Now that the *initializer* accepts no parameters, you need to create the Struct like this.
```
var user = User()
user.username = "twostraws"
```
**9.2 Referring to the Current Instance**  
Inside Methods, you get a special constant called **self**, which points to whatever instance of the struct is currently being used. This **self** value is particularly useful when you create initializers that have the same parameter names as your property.  

For example, lets say you create a struct named *Person* with a *name* property, then tried to write an initializer that accepted a *name* parameter, **self** helps you distinguish between the property and the parameter - **self.name** refers to the property, whereas **name** refert to the parameter.
```
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}
```
**9.3 Lazy Properties**  
As a performance optimization, Swift lets you create some properties only when they are needed. For example, consider this *FamilyTree* Struct - it doesn't do much, but in theory creating a family tree for someone takes a long time.
```
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}
```
You might use the *FamilyTree* Struct as a property inside a *Person* Struct like this.
```
struct Person {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")
```
But what if you don't always need the family tree for a particular person. If you add the **lazy** keyword to the *FamilyTree* property, then Swift will only create the *FamilyTree* Struct when it's first accessed.
```
struct Person {
    var name: String
    lazy var familyTree = FamilyTree()  // Added the lazy keyword

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")
```
If you want to see the "Creating family tree!" message, you need to access the property at least once.
```
ed.familyTree
```
**9.4 Static Properties and Methods**  
So far all properties and methods you have created all belong to individual instances of a struct, which means that if you had a *Student* struct you could create several student instances - each with their own properties and methods.  

Here you can ask Swift to share specific properties and methods across all instances of the struct by declaring them as **static**.  

For example, let's add a **static** property to the *Student* struct to store how many students are in the class. Each time you create a new student, the struct will add one to it.
```
struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
```
Because the *classSize* property belongs to the struct itself rather than instances of the struct, you need to read it using **Student.classSize**.
```
print(Student.classSize)
```
**9.5 Access Controll**  
Access control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly.  

In this example, adding the keyword **private** to the variable *id*, means only methods inside *Person* struct can read the property *id*.
```
struct Person {
    private var id: String

    init(id: String) {
        self.id = id
    }
}
```
Another common option is **public**, which lets all other code use the property or method.
