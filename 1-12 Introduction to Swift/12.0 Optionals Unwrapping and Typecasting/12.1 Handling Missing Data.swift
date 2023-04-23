// **Int** is used to hold numbers like 5, but if you want to store an *age* property for users, what would you do if you didn't know someone's age?

// For this, Swift has a solution called *optionals*, and you can make optionals out of *any* type. An optional integer might have a number like 5 or 40, but it might also have no value - it might acutally be missing, which is **nil**.

var age: Int? = nil

// Until now, the variable **age** doesn't hold any number. But you can add one later in the process, like this.
age = 38
