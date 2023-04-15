// As well as recieving data, a function can also send back data. In order to do this, put " -> " after your function's parameter, then say what type of data to be returned.
// Inside your function use the **return** keyword to send a value back. Your function then immediately exits - no other code from that function will be run.

import Foundation


func square(number: Int) -> Int {
    return number * number
}

let result = square(number: 8)
print(result)
