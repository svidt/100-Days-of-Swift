//
//  ContentView.swift
//  WordScramble
//
//  Created by Svidt on 10/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            
            List {
                Section {
                    ForEach(1..<4) { num in
                        Text("\(num) Hello, world!")
                    }
                }
                Section {
                    ForEach(usedWords, id: \.self) {
                        word in
                        Text(word)
                    }
                }
            }.navigationTitle("WordScramble")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
