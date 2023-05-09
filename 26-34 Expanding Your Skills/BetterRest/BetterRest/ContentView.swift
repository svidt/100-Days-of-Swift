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
        
        NavigationView {
            ZStack {
                
                RadialGradient(gradient: Gradient(colors: [.secondary, Color(UIColor.systemBackground)]), center: .bottom, startRadius: 0, endRadius: 500).ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Image(systemName: "moon.fill").padding()
                            .imageScale(.large)
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                            .blur(radius: 10)
                            .padding()
                        Image(systemName: "moon.fill").padding()
                            .imageScale(.large)
                            .font(.largeTitle)
                            .foregroundColor(.secondary)
                            .blur(radius: 0)
                            .padding()
                    }
                    .padding()
                    
//                    Text(Date.now, format: .dateTime.day().month().year())
//                    Text(Date.now, format: .dateTime.hour().minute())
                    
                    Form {
                        
                        Section {
                            Picker("Daily coffee intake", selection: $coffeeAmount) {
                                ForEach(1..<11) {
                                    Text("\($0) Cups")
                                }
                            }
                            .font(.headline)
                            .buttonStyle(.bordered)
                            .tint(.white)
                            .pickerStyle(.menu)
                        }
                        Section {
                            
                            HStack {
                                
                                Text("When would you like to wake up?")
                                    .font(.headline)
                                Spacer()
                                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                            }
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Desired amount of sleep")
                                    .font(.headline)
                                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.50)
                            }
                        }
                        
                        //                            VStack(alignment: .leading, spacing: 0) {
                        //                                Text("Daily coffee intake")
                        //                                    .font(.headline)
                        //                                Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                        //                            }
                        Section {
                            HStack {
                                Text("Your ideal bedtime is").font(.headline)
                                Spacer()
                                Text(calcBedTime).font(.title)
                            }
                        }.listRowBackground(Color.clear)
                    }
                    .scrollContentBackground(.hidden)
                    


                    
                    
                    //                    Button(action: { calculateBedtime() }) {
                    //                        Text("Calculate")
                    //                            .padding(20)
                    //                            .background(.regularMaterial)
                    //                            .foregroundColor(.primary)
                    //                            .clipShape(Capsule())
                    //                    }
                    //                    .alert(alertTitle, isPresented: $showingAlert) {
                    //                        Button("OK") { }
                    //                    } message: {
                    //                        Text(alertMessage)
                    //                    }
                    
                }
                .navigationTitle("BetterRest")
            }
        }
        .preferredColorScheme(.dark)
    }
    
    //    func calculateBedtime() {
    //        do {
    //            let config = MLModelConfiguration()
    //            let model = try BetterRestCalculator(configuration: config)
    //
    //            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
    //            let hour = (components.hour ?? 0) * 60 * 60
    //            let minute = (components.minute ?? 0) * 60
    //
    //            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
    //
    //            let sleepTime = wakeUp - prediction.actualSleep
    //            alertTitle = "Your ideal bedtime is..."
    //            bedTime = sleepTime.formatted(date: .omitted, time: .shortened)
    //
    //        } catch {
    //            alertTitle = "Error"
    //            alertMessage = "Sorry, there was a problem calculating your bedtime."
    //        }
    //
    //        showingAlert = true
    //    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
