// The final difference between classs and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can't be changed because the struct itself is constant.


// If however you have a constant *class* with a variable property, that property *can* be changed. Because of this, classes don't need the **mutating** keyword, as *structs* would need.


class Singer {
    var name = "Taylor Swift"
}

let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)

// If you want to stop this change from happening, you need to make the property *constant*, using the **let** keyword instead.
class Singer {
    let name = "Taylor Swift"
}
