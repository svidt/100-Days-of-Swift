//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Svidt on 06/12/2023.
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
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            Text("Searching for \(searchText)")
                .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("Searching")
        }
    }
}

#Preview {
    ContentView()
}
