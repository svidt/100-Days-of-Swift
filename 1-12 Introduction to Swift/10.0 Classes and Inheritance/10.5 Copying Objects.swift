// The third 3/5 difference between classes and structs, is how they are copied. You can copy a struct, both the original and the copy are different things - changing one won't affect the other.

// When you copy a *class* though, both the original and the copy points to the same thing, so changing one *does* change the other.

class Singer {
    var name = "Taylor Swift"
}


// The following creates an instance of the class *Singer()* and print its name.
var singer = Singer()
print(singer.name)

// Now if we craete a second variable from the first and change its name.
var singerCopy = singer
singerCopy.name = "Justin Bieber"

// Because of the way classes work, both *singer* and *singerCopy* points to the same block in memory, so printing the singer name again; you'll see "Justin Bieber".
print(singer.name)

// This wouldn't have been the case if *Singer* were a struct.
