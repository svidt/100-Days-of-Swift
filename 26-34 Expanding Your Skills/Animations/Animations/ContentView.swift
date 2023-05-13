//
//  ContentView.swift
//  Animations
//
//  Created by Svidt on 11/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    @State private var animationPulse = 1.0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Button("Enlarge me") {
                animationAmount += 0.5
            }
            .padding(50)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            //            .blur(radius: (animationAmount - 1) * 3)
            .animation(
                .interpolatingSpring(stiffness: 200, damping: 20),
                value: animationAmount)
            
            Spacer()
            
            Button("Shrink me") {
                animationAmount -= 0.5
            }
            .padding(50)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.green)
                    .scaleEffect(animationPulse)
                    .opacity(2 - animationPulse))
            .animation(
                .easeInOut(duration: 1)
                .repeatForever(autoreverses: false),
                       value: animationPulse
            )
            
            Spacer()
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10, step: 0.1)
        }
        .onAppear {
            animationPulse = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
