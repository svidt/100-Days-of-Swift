// If you want to skip an item, use the **continue** keyword.
// Remember, the remainder operator figures out how many times the number "2" fits inside each number in our loop, then returns what's left. If 1 is left, it means the number is *odd* and we can use **continue** to skip it.
import Foundation

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}
