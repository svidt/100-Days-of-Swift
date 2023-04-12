// Raw values can sign numbers automatically. However you can also asign specific values and Swift with do the rest.

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 3)
