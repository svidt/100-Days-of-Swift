//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Kristian Emil on 06/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("Secondary")
            } label: {
                
                Text("Hello World")
            }
                .navigationTitle("Primary")
         
            Text("Third")
            
            Text("Forth")
        }
    }
}

#Preview {
    ContentView()
}
