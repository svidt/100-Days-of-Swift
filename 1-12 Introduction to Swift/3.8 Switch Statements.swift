// Instead of having a long and complicated * if / else * setup, *Switch Case* offer a more clear overview. The last case - **default** triggers if none of the cases are true.  Swift only run the code inside the case, if you want the execution to contines: use the **fallthrough** keyword.

import Foundation

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}


