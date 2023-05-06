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
    
    
    func battle(playerMove: String, cpuMove: String) -> String {
        
        var result = ""
        
        if playerMove == cpuMove {
            result = "Draw"
        } else if playerMove == "Rock" && cpuMove == "Scissors" {
            result = "Win"
        } else if playerMove == "Paper" && cpuMove == "Rock" {
            result = "Win"
        } else if playerMove == "Scissors" && cpuMove == "Paper" {
            result = "Win"
        } else {
            result = "Defeat"
        }
        
        return result
    }
    
    @State private var gameResult = "Who's gonna win?"
    
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
                    gameResult = (battle(playerMove: selectedMove, cpuMove: gameChoices[randomNumber]))
                }
                .buttonStyle(.borderedProminent)
            }
            Text(gameResult).font(.largeTitle)
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
