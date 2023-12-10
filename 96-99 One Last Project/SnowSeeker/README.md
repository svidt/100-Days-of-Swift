Environment horizontalSizeClass

Let's tells us how much space is available on a given device.
Mini/Mid iPhone sizes have compact in any orientation, while Plus/Max models have compact in portrait, but Regular in landscape orientation. 

EXAMPLE

    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            VStack {
                UserView()
            }
        } else {
            HStack { UserView()}
        }
    }
