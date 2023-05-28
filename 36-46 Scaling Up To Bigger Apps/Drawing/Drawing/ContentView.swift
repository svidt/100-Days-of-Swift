//
//  ContentView.swift
//  Drawing
//
//  Created by Kristian Emil Hansen Svidt on 27/05/2023.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY * 2))
            
        return path
    }
}

struct ContentView: View {
    @State private var amount = 8.0
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(.red, style: StrokeStyle(lineWidth: amount, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)
                .onTapGesture {
                    withAnimation{
                        amount += 10
                        
                        
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
