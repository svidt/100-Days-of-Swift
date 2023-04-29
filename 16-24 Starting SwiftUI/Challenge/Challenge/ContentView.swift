//
//  ContentView.swift
//  Challenge
//
//  Created by Svidt on 29/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userInput = Double(0)
    @State private var userInputMethod = String()
    @State private var userOutput = Double(0)
    @State private var userOutputMethod = String()
    
    @FocusState private var isFocused: Bool
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    func calculate() {
        if userInputMethod == userOutputMethod {
            userOutput = userInput
        }
        if userInputMethod == "Celsius" && userOutputMethod == "Fahrenheit" {
            userOutput = (userInput * 1.8) + 32
        }
        if userInputMethod == "Fahrenheit" && userOutputMethod == "Celsius" {
            userOutput = (userInput - 32) * (5/9)
        }
        if userInputMethod == "Celsius" && userOutputMethod == "Kelvin" {
            userOutput = userInput + 273.15
        }
        if userInputMethod == "Kelvin" && userOutputMethod == "Celsius" {
            userOutput = userInput - 273.15
        }
        if userInputMethod == "Fahrenheit" && userOutputMethod == "Kelvin" {
            userOutput = (userInput + 459.67) * (5/9)
        }
        if userInputMethod == "Kelvin" && userOutputMethod == "Fahrenheit" {
            userOutput = userInput * (9/5) - 459.67
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Choose What Metric To Calculate", value: $userInput, format: .number)
                            .keyboardType(.numberPad)
                            .focused($isFocused)
                        Picker("Choose your metric", selection: $userInputMethod) {
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Choose your input")
                    }
                    Section {
                        Picker("Hello", selection: $userOutputMethod) {
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        Text(userOutput, format: .number)
                        
                    } header: {
                        Text("Choose your output")
                    }
                }
                .navigationTitle("Unit Conversion")
                .scrollContentBackground(.hidden)
                .background(Color.yellow)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Calculate") {
                            calculate()
                            isFocused = false
                        }
                        .foregroundColor(.white)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                    }
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
