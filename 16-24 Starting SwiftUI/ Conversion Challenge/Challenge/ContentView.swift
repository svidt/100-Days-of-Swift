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
    
    func calculate() -> Double {
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
        
        return userOutput
    }
    
    var result: Double {
        return calculate()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("", value: $userInput, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                        Picker("Choose your metric", selection: $userInputMethod) {
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Choose your metric")
                    }
                    Section {
                        Picker("Conversion", selection: $userOutputMethod) {
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        Text(result, format: .number)
                        
                    } header: {
                        Text("Result")
                    }
                }
                
                .navigationTitle("Unit Conversion")
                .scrollContentBackground(.hidden)
                .background(LinearGradient(gradient: Gradient(colors: [.red.opacity(0.5), .teal.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            calculate()
                            isFocused = false
                        }
                        .foregroundColor(.primary)
                        .buttonStyle(.bordered)
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
