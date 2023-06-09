// Arrays are annotated using square brackets " [ ] " and count from 0, meaning the first value in an array is numbered 0 and so on.
// Swift crashes if you read an item that doesn't exist - be careful!

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]


// Both of following examples are correct. The second are just two characters shorter, and therefore more often used.

var songs: [String] = []

var songs = [String]()
