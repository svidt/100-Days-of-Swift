//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Svidt on 29/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    @State private var animationNumber = [0, 0, 0]
    @State private var animationWrong = [1.0, 1.0, 1.0]
    
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = "Have a guess"
    @State private var scoreSubtitle: String = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    @State private var chances = 2
    
    var body: some View {
        NavigationView {
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    
                    VStack {
                        
                        Text("Tap the flag of").font(.title)
                        Text(countries[correctAnswer]).font(.largeTitle).bold()
                        
                    }
                    .foregroundStyle(.white)
                    
                    Spacer()
                    
                    VStack(spacing: 30) {
                        
                        ForEach(0..<3, id: \.self) { number in
                            Button {
                                flagTapped(number)
                                } label: {
                                Image(countries[number])
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .opacity(Double(animationWrong[number]))
                            .rotation3DEffect(.degrees(Double(animationNumber[number])), axis: (x: 0, y: 1, z: 0))
                            .animation(.easeInOut(duration: 1), value: animationNumber[number])
                            .animation(.easeInOut(duration: 1), value: animationWrong[number])
                            .shadow(radius: 20)
                            
                            
                        }
                        .animation(.easeInOut, value: countries)
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(.thinMaterial)
                            .frame(width: 200, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        VStack(alignment: .leading) {
                            Text("Score: \(score)").bold()
                            Text("Chances: \(chances + 1)").bold()
                        }
                    }
                    
                    Spacer()
                    
                }
                .padding(50)
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text(scoreSubtitle)
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
            scoreSubtitle = "Your score is \(score)"
            if number == 0 {
                animationNumber[number] += 360
                print(animationNumber[number])
                animationWrong[1] -= 0.8
                animationWrong[2] -= 0.8
                print(animationWrong)
            } else if number == 1 {
                animationNumber[number] += 360
                print(animationNumber[number])
                animationWrong[0] -= 0.8
                animationWrong[2] -= 0.8
                print(animationWrong)
            } else if number == 2 {
                animationNumber[number] += 360
                print(animationNumber[number])
                animationWrong[0] -= 0.8
                animationWrong[1] -= 0.8
                print(animationWrong)
            }
        } else if chances < 1 {
            resetAll()
            scoreTitle = "Too bad"
            scoreSubtitle = "Your final score was \(score)"
            }
        else {
            chances -= 1
            scoreTitle = "Wrong"
            scoreSubtitle = "The correct answer was \(countries[correctAnswer])"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        animationWrong = [1, 1 ,1]
    }
    
    func resetAll() {
        score = 0
        chances = 2
        animationNumber = [0, 0, 0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
