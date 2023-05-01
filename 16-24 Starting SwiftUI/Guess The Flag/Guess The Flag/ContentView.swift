//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Kristian Emil Hansen Svidt on 29/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = "Have a guess"
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    
    var body: some View {
        
        ZStack {
            
//            RadialGradient(stops: [
//                .init(color: Color(red: 0.8, green: 0.5, blue: 0.5), location: 0.1),
//                .init(color: Color(red: 0.2, green: 0.3, blue: 0.8), location: 0.5)
//            ], center: .bottom, startRadius: 100, endRadius: 800)
//            .ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topTrailing, endPoint: .bottomLeading).ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag").font(.largeTitle.bold()).foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    
                    VStack {
                        
                        Text("Tap the flag of").font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer]).font(.largeTitle.weight(.semibold))
                        
                    }.foregroundStyle(.white)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
    //                            .clipShape(Capsule())
                                .cornerRadius(20)
                                .shadow(color: .white, radius: 1)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 50)
                .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: \(score)").font(.title3.bold()).foregroundStyle(.secondary)
                Text(scoreTitle).font(.title2.bold()).foregroundStyle(.secondary)
                Spacer()
            }
            .padding(25)
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
