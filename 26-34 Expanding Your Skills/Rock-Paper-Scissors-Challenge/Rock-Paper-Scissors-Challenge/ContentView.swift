//
//  ContentView.swift
//  Rock-Paper-Scissors-Challenge
//
//  Created by Svidt on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var appMove = ""
    @State private var winLose = ""
    @State private var playerMove = ""
    
    @State private var preResult = ""
    @State private var endResult = ""
    
    @State private var playerPoints = 0
    @State private var appPoints = 0
    
    @State private var animationScale = 1.0
    
    let moves = ["Rock", "Paper", "Scissors"]
    let factor = ["Win", "Lose"]
    let colors = [Color.purple, Color.green, Color.teal, Color.blue, Color.red, Color.orange, Color.yellow]
    let positions = [UnitPoint.topLeading, UnitPoint.top, UnitPoint.topTrailing, UnitPoint.bottomLeading, UnitPoint.bottom, UnitPoint.bottomTrailing, UnitPoint.leading, UnitPoint.trailing, UnitPoint.center]
    
    var body: some View {
        NavigationView {
            
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [colors[Int.random(in: 0..<colors.count)], colors[Int.random(in: 0..<colors.count)]]),
                               startPoint: positions[Int.random(in: 0..<positions.count)],
                               endPoint: positions[Int.random(in: 0..<positions.count)])
                .ignoresSafeArea()
                .opacity(0.5)
                
                VStack {
                    
                    HStack {
                        Text("\(playerPoints)").font(.largeTitle)
                        Text("Your points")
                        Spacer()
                        Text("Phone points")
                        Text("\(appPoints)").font(.largeTitle)
                    }
                    .padding(.horizontal, 25)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("App chooses: ")
                            Text(appMove).bold()
                        }
                        
                        HStack {
                            Text("You need to: ")
                            Text(winLose).bold()
                        }
                    }
                    .font(.title)
                    .padding(25)
                    
                    
                    Text("Pick your weapon")
                    HStack {
                        ForEach(moves, id: \.self) { choice in
                            Button(action: {
                                playerMove = choice
                                play(selected: playerMove)
                                endResult = ""
                            }) { Text(choice) }
                                .pickerStyle(.segmented)
                                .padding(25)
                                .background(colors[Int.random(in: 0..<colors.count)])
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .animation(.default, value: playerMove)
                        }
                    }
                    
                    Spacer()
                    VStack(spacing: 10) {
                        HStack {
                            Text("You have selected: ")
                            Text(playerMove).bold()
                        }
                        HStack {
                            Text(endResult).bold()
                        }
                    }
                    
                    Button("Play") {
                        calculate(a: winLose, b: preResult)
                        gameStart()
                        
                    }
                    .frame(width: 150, height: 150)
                    .background(colors[Int.random(in: 0..<colors.count)])
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .clipShape(Capsule())
                    .padding(25)
                    .scaleEffect(animationScale)
                    .animation(.easeInOut(duration: 1).repeatForever(),  value: animationScale)
                    .onAppear() {
                        animationScale += 0.1
                    }
                    Button("Reset") {
                        gameRestart()
                    }
                    .padding()
                    //
                }
                .onAppear() {
                    gameStart()
                }
                .navigationTitle("Rock Paper Scissors")
            }
        }
    }
    
    func gameRestart() {
        
        appMove = moves[Int.random(in: 0..<moves.count)]
        winLose = factor[Int.random(in: 0..<factor.count)]
        
        preResult = ""
        endResult =  ""
        playerMove = ""
        playerPoints = 0
        appPoints = 0
    }
    
    func gameStart() {
        
        appMove = moves[Int.random(in: 0..<moves.count)]
        winLose = factor[Int.random(in: 0..<factor.count)]
        playerMove = ""
        
    }
    
    func play(selected: String) {
        
        playerMove = selected
        
        if playerMove == appMove {
            preResult = "Draw"
        } else if playerMove == "Rock" && appMove == "Paper" {
            preResult = "Lose"
        } else if playerMove == "Paper" && appMove == "Scissors" {
            preResult = "Lose"
        } else if playerMove == "Scissors" && appMove == "Rock" {
            preResult = "Lose"
        } else if playerMove == "Rock" && appMove == "Scissors" {
            preResult = "Win"
        } else if playerMove == "Paper" && appMove == "Rock" {
            preResult = "Win"
        } else if playerMove == "Scissors" && appMove == "Paper" {
            preResult = "Win"
        } else {
            preResult = "Error"
        }
    }
    
    func calculate(a: String, b: String) {
        
        if a == b {
            endResult = "You really won!"
            playerPoints += 1
            preResult = ""
        } else if a != b && playerMove != "" && preResult != "" {
            endResult =  "You unfortunately lost!"
            appPoints += 1
            preResult = ""
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
