//
//  ContentView.swift
//  Rock-Paper-Scissors-Challenge
//
//  Created by Svidt on 06/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gameChoices = ["Rock", "Paper", "Scissors"]
    @State private var selectedMove = ""
    @State private var randomNumber = 0
    @State private var winOrLose: Bool = false
    @State private var pointsCollected = 0
    
    
    func battle(playerMove a: String, cpuMove b: Int) -> Int {
        
        let a = 0
        let b = 2
        
        let result = a + b
        
        return result
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Player Score").font(.largeTitle)
            Text("points \(pointsCollected)").bold()
            
            Spacer()
            
            HStack(spacing: 10) {
                Text("You must")
                if winOrLose == true {
                    Text("Win").bold()
                } else {
                    Text("Lose").bold()
                }
                Text("Against")
                Text(gameChoices[randomNumber]).bold()
            }
            HStack {
                Picker("Select your move", selection: $selectedMove) {
                    ForEach(gameChoices, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                Spacer()
                
                Button("Random") {
                    winOrLose = Bool.random()
                    randomNumber = Int.random(in: 0...2)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Play move") {
                    battle(playerMove: , cpuMove: <#T##Int#>)
                }
                .buttonStyle(.borderedProminent)
            }
            Spacer()
        }
        .padding(25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
