//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Kristian Emil Hansen Svidt on 24/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            HStack(alignment: .firstTextBaseline) {
                Text("Hello")
                    .font(.largeTitle)
                Text("Hello")
                    .font(.title)
                Text("Hello")
                    .font(.title2)
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
