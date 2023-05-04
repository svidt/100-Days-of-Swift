//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Svidt on 29/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = "Have a guess"
    @State private var scoreSubtitle: String = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    @State private var totalTries = 2
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topTrailing, endPoint: .bottomLeading).ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag").font(.largeTitle.bold()).foregroundStyle(.white)
                
                VStack(spacing: 25) {
                    
                    VStack {
                        
                        Text("Tap the flag of").font(.title3.weight(.heavy))
                        
                        Text(countries[correctAnswer]).font(.largeTitle.weight(.semibold))
                        
                    }.foregroundStyle(.white)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .cornerRadius(20)
                                .shadow(color: .white, radius: 1)
                        }
                    }
                    VStack(spacing: 0) {
                        Text("Score: \(score)").font(.title3.bold()).foregroundStyle(.secondary)
                        Text("Chances: \(totalTries + 1)").font(.title3.bold()).foregroundColor(.secondary)
                        Text(scoreTitle).font(.title2.bold()).foregroundStyle(.secondary).padding(10)
                    }
                    .padding(.top, 50)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 50)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
            }
            .padding(25)
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreSubtitle)
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
            scoreSubtitle = "Your score is \(score)"
            
        } else if totalTries < 1 {
            scoreTitle = "Too bad"
            scoreSubtitle = "Better luck next time. Your score was \(score)"
            resetAll()
        } else {
            totalTries -= 1
            scoreTitle = "Wrong"
            scoreSubtitle = "The correct answer was \(countries[correctAnswer])"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetAll() {
        score = 0
        totalTries = 3
        scoreTitle = "Try Again"
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
