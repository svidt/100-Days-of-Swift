//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Kristian Emil on 06/12/2023.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Svidt")
            Text("Country: DK")
            Text("Pets: NONE")
        }
        .font(.title)
    }
}

struct ContentView: View {
    
    //    @State private var layoutVertically = false
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
}

#Preview {
    ContentView()
}
