//
//  ContentView.swift
//  BetterRest
//
//  Created by Svidt on 07/05/2023.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    //    @State private var wakeUp = Date.now
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var bedTime = "zzz"
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var calcBedTime: String {
        do {
            let config = MLModelConfiguration()
            let model = try BetterRestCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            bedTime = "Error"
        }
        
        return bedTime
        
    }
    
    
    var body: some View {
        
        // Animation
        let coffeeToScale = Double(coffeeAmount + 3) * 0.2
        
        NavigationView {
            ZStack {
                
                RadialGradient(gradient: Gradient(colors: [.brown, Color(UIColor.systemBackground)]), center: .bottom, startRadius: 0, endRadius: 500 * coffeeToScale).ignoresSafeArea().animation(.easeInOut, value: coffeeToScale)
                
                
                VStack {
                    
                    
                    Button(action: { coffeeAmount = 1 }) {
                    ZStack {
                        Image(systemName: "cup.and.saucer.fill")
                            .imageScale(.large)
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                            .blur(radius: 10)
                        
                        
                            Image(systemName: "cup.and.saucer.fill")
                                .imageScale(.large)
                                .font(.largeTitle)
                                .foregroundColor(.primary)
                        }
                    }
                
                    .padding(coffeeToScale * 25)
                    .scaleEffect(coffeeToScale)
                    .rotationEffect(.degrees(Double(coffeeAmount) - 1) * 2)
                    .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: coffeeToScale)
                    
                    //                    Text(Date.now, format: .dateTime.day().month().year())
                    //                    Text(Date.now, format: .dateTime.hour().minute())
                    
                    Form {
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Daily coffee intake")
                                .font(.headline)
                            Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                        }
                        
                        Section {
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Desired amount of sleep")
                                    .font(.headline)
                                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.50)
                            }
                            
                            HStack {
                                
                                Text("When would you like to wake up?")
                                    .font(.headline)
                                Spacer()
                                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                            }
                        }
                        
                        Section {
                            HStack {
                                Text("Your ideal bedtime is").font(.headline)
                                Spacer()
                                Text(calcBedTime).font(.title).bold()
                            }
                        }.listRowBackground(Color.clear)
                    }
                    .scrollContentBackground(.hidden)
                    .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: coffeeToScale)
                    
                }
                .navigationTitle("BetterRest")
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
