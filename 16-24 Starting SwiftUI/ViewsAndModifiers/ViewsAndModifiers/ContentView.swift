//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Kristian Emil Hansen Svidt on 03/05/2023.
//

import SwiftUI

struct CapsuleTextGreen: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .padding()
            .foregroundColor(.white)
            .background(.green)
            .clipShape(Capsule())
    }
}
struct CapsuleTextBlue: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .background(.yellow)
            .cornerRadius(25)

    }
}

struct ContentView: View {
    
    @State private var tiggleToggle = false
    
    var body: some View {
        VStack {
            Button("Click me") {
                tiggleToggle.toggle()
            }
            .modifier(ButtonStyle())
            
            Button("Click me") {
                tiggleToggle.toggle()
            }
            .frame(width: 100, height: 100)
            .background(tiggleToggle ? .red : .blue)
            .cornerRadius(15)
            .foregroundColor(.white)
            
            
            
            CapsuleTextGreen(text: "Hello, how are you today")
            CapsuleTextBlue(text: "Hi, i'm good thank you")
            CapsuleTextBlue(text: "How are you?")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
