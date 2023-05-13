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
    
    @State private var animationShape = 1.0
    @State private var animationRotate = 1.0
    
    var body: some View {
        VStack {

            Button("Rotate") {
                withAnimation(.easeOut(duration: 1)) {
                    animationRotate += 360
                    
                }
            }
            .padding(25)
            .background(.yellow)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationRotate), axis: (x: 1, y: 1, z: 1))
            .padding(50)
            
            Button("Pulse") {
//                animationShape += 1
            }
            .padding(25)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationShape)
                    .opacity(2 - animationShape))
            .animation(
                .easeInOut(duration: 1)
                .delay(1)
                .repeatForever(autoreverses: false), value: animationShape
            )
            
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
            animationShape = 2.0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
