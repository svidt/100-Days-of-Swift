//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Svidt on 04/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    let pictures = [
        "j-lee",
        "j-lee 1",
        "j-lee 2",
        "j-lee 3"
    ]
    
    let labels = [
        "Tulips",
        "Sunflowers",
        "Bird",
        "Airplane"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    @State private var value: Int = 10
    
    var body: some View {
        VStack {
            Image(decorative: pictures[selectedPicture])
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    selectedPicture = Int.random(in: 0...3)
                }
                .accessibilityLabel(labels[selectedPicture])
                .accessibilityAddTraits(.isButton)
                .accessibilityRemoveTraits(.isImage)
            
            Group {
                Text("Your score is: ")
                Text("1000")
                    .font(.title)
            }
            .accessibilityLabel("Your score is 2000")
            
            Group {
                Text("Value: \(value)")
                Button("Increment") {
                    value += 1
                }
                Button("Decrement") {
                    value -= 1
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
