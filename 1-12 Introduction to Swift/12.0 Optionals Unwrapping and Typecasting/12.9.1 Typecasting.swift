// Swift must always know the type of each of your variables, but sometimes you know more information than Swift does. For example, here are three classes.

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

// Here are a couple of fish- and a couple of dogs-objects in an array.
let pets = [Fish(), Dog(), Fish(), Dog()]

// Swift knows all *pets[]* inherit from the *Animal* class. But if you want to loop through all objects in the array and only make the dogs bark, do like this.

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

// This uses the keyword **as?**, which returns an optional: it will be **nil** if the typecast failed, or a converted type otherwise.
