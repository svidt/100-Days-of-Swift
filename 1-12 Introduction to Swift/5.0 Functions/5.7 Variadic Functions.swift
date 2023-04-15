// Some functions are *variadic* which is a fancy way of saying they accept any number of parameters of the same type. You can make any function *variadic* by writing " ... " after its type.

import Foundation

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)
