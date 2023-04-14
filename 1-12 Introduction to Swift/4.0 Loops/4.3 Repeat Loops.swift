// Repeat loops are not commonly used, but it's simple to learn. It's identical to a *While Loop* except the condition to check comes at the end, meaning it garantees to run the code at least once.

import Foundation

var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")
