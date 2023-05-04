//
//  ContentView.swift
//  WeSplit
//
//  Created by Svidt on 27/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / Double(numberOfPeople)
        
        return amountPerPerson
    }
    
    var costTip: Double {
        let tipSelection = Double(tipPercentage)
        let tipAdded = checkAmount / 100 * tipSelection - tipSelection
        let totalCost = tipSelection + tipAdded
        
        return totalCost
    }
    
    var totalCost: Double {
        let tipSelection = Double(tipPercentage)
        let tipAdded = checkAmount / 100 * tipSelection
        let totalCost = tipAdded + checkAmount
        
        return totalCost
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Check Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(0..<9) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Other Amount", value: $tipPercentage, format: .percent)
                } header: {
                    Text("Added Tip")
                }
                .keyboardType(.decimalPad)
                .focused($amountIsFocused)
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount Per Person")
                } footer: {
                    HStack {
                        //                        Spacer()
                        VStack(alignment: .leading, spacing: 2) {
                            Text("\(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")) Check")
                            Text("\(costTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD")) Tip (\(tipPercentage)%)")
                            Text("\(totalCost, format: .currency(code: Locale.current.currency?.identifier ?? "USD")) Total").bold()
                        }
                        .padding(.top, 10.0)
                    }
                }
            }
            .padding(10)
            .navigationTitle("WeSplit")
            .scrollContentBackground(.hidden)
            .background(RadialGradient(gradient: Gradient(colors: [
                Color(red: 1, green: 0.3, blue: 0.3, opacity: 0.5),
                Color(red: 00, green: 0, blue: 0, opacity: 0.1),
            ]), center: .bottom, startRadius: 0, endRadius: 400)
                .edgesIgnoringSafeArea(.all))
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
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
