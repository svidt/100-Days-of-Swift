// Extentions allow you to add methods to existing type, to make them do things they weren't originally designed to do.

// You could add an extention to the **Int** type so that it has a **squared()** method that returns the current number multiplied by it self.

extension Int {
    func squared() -> Int {
        return self * self
    }
}

// To try it out you just create an integer and you'll see it now has a *squared()* method.

let number = 8
number.squared()

//Swift doesn't allow you to add stored properties in extentions, so you must use computed properties instead.
