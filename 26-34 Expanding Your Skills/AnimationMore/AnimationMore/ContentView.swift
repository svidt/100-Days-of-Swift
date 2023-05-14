//
//  ContentView.swift
//  AnimationMore
//
//  Created by Kristian Emil Hansen Svidt on 13/05/2023.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    
    @State private var isShowingRed = false
    
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    @State private var isShowing = false
    
    var body: some View {
        
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShowing.toggle()
                }
            }
            if isShowing {
                Button(action: { enabled.toggle() }, label: {
                    LinearGradient(gradient: Gradient(colors: [enabled ? .yellow : .green, enabled ? .red : .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: enabled ? 300 : 200, height: enabled ? 200 : 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .offset(dragAmount)
                        .gesture(
                            DragGesture()
                                .onChanged { dragAmount = $0.translation }
                                .onEnded { _ in
                                    withAnimation(.spring()) {
                                        dragAmount = .zero
                                    }
                                }
                        )
                        .animation(.spring(), value: enabled)
                })
                .transition(.scale)
                
                
            }
            
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.pivot)
                }
            }.onTapGesture {
                withAnimation {isShowingRed.toggle() }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
