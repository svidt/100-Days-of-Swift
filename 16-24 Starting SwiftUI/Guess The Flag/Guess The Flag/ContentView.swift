//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Kristian Emil Hansen Svidt on 29/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottomLeading)
                
                //                AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .white]), center: .center)
                
                
                //                RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .bottom, startRadius: 50, endRadius: 500)
                
                //                LinearGradient(gradient: Gradient(stops: [
                //                    Gradient.Stop(color: .yellow, location: 0.75),
                //                    Gradient.Stop(color: .orange, location: 1)
                //                ]), startPoint: .top, endPoint: .bottom)
                
            }
            
            HStack {
                
                Text("Primary")
                    .foregroundColor(.primary)
                    .padding(25)
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                Text("Secondary")
                    .foregroundStyle(.secondary)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                Button("Delete", role: .destructive) {
                    print("deleted")
                    showingAlert = true
                }
                .buttonStyle(.borderedProminent)
                .alert("Important Message", isPresented: $showingAlert) {
                    Button("Cancel", role: .cancel) { }
                    Button("Delete", role: .destructive) { }
                } message: {
                    Text("Please read this.")
                }
                
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
