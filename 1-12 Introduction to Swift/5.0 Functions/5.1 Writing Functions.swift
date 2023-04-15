// Functions let you re-use code, which means we can write a function to do something interesting, then run that function from multiple places within your code. Repeating code is generally a bad idea, and functions can help us avoid that. Running a Function is often refered to as *calling* a Function.

import Foundation

func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}

printHelp()
