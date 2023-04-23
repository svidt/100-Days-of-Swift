// The *nil coalescing* operator unwraps an optional and returns the value inside if there is one. If there isn't a value - the optional was *nil* - then a default value is used instead. Either way, the result won't be an optional; it will either be the original value inside, or the default value used as a backup.


func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

// If we call this function using for example "15", we will get back **nil** becuase the user isn't recognized. But with *nil coalescing* we can provide a default value of "Anonymous" like this:

let user = username(for: 15) ?? "Anonymous"
