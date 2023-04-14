## 4.1 Loops
**4.1 For Loops**
There are many kinds of loops, but they all have the same underlaying mechanism: run code repeatedly until a condition evaluates as false.  The most common loop in Swift is a *for* loop: it will loop over arrays and ranges, and each time the loop goes around it will pull out one item and assign it to a constant.
```
let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")
```
If you don't want to use the Constant a For Loop gives you, you can use an underscore " _ ".
```
for _ in 1...5 {
    print("play")
}
```
**4.2 While Loops**
A While Loop: give it a condition to check and its loop-code will go around and around until the condition fails.
```
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")
```
**4.3 Repeat Loops**
Repeat loops are not commonly used, but it's simple to learn. It's identical to a *While Loop* except the condition to check comes at the end, meaning it garantees to run the code at least once.
```
var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")
```
**4.4 Exiting Loops**
If you want to exit a loop early, use the **break** keyword.
```
var countDown = 10

while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}
```
**4.5 Exiting Multiple Loops**
When breaking out of multiple loops or nested loops. First you must label the outer loop like this, and then use the **break** keyword along with the name of the outer loop.
```
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}
```
**4.6 Skipping Items**
If you want to skip an item, use the **continue** keyword.  
Remember, the remainder operator figures out how many times the number "2" fits inside each number in our loop, then returns what's left. If 1 is left, it means the number is *odd* and we can use **continue** to skip it.
```
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}
```
**4.7 Infinite Loops**
It's common to use *while loops* to make *infinite loops*, that means a loop that will either never end or only end when you are ready. Here's an example of an infinite loop that just counts upwards - if though; it reaches 273 it breaks out.
```
var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
```
