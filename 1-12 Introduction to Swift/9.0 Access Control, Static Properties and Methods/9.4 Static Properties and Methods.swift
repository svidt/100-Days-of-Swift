// So far all properties and methods you have created all belong to individual instances of a struct, which means that if you had a *Student* struct you could create several student instances - each with their own properties and methods.

// Here you can ask Swift to share specific properties and methods across all instances of the struct by declaring them as **static**.

// For example, let's add a **static** property to the *Student* struct to store how many students are in the class. Each time you create a new student, the struct will add one to it.

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

// Because the *classSize* property belongs to the struct itself rather than instances of the struct, you need to read it using **Student.classSize**.

print(Student.classSize)
