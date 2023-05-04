//
//  ContentView.swift
//  WeSplit
//
//  Created by Svidt on 27/04/2023.
//

import SwiftUI



struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @State private var customPercentage = 0.0
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        var amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var costTip: Double {
        let tipSelection = Double(tipPercentage)
        let tipAdded = checkAmount / 100 * tipSelection - tipSelection
        let totalCost = tipSelection + tipAdded
        
        return totalCost
    }
    
    var costCombined: Double {
        
        let customPercentage = Double(customPercentage)
        let tipSelection = Double(tipPercentage)
        let tipAdded = checkAmount / 100 * tipSelection
        let totalCost = tipAdded + checkAmount
        
        if customPercentage > 0 {
            let newTipAdded = checkAmount / 100 * customPercentage
            let newTotalCost = newTipAdded + checkAmount
        }
        
        
        return totalCost
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<11) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Other amount", value: $tipPercentage, format: .percent)
                } header: {
                    Text("Added tip")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
                } footer: {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(costTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD")) Tip")
                        Text("\(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")) Check")
                        Text("\(costCombined, format: .currency(code: Locale.current.currency?.identifier ?? "USD")) Total")
                    }
                    .padding(.top, 10.0)
                    
                }
            }
            .navigationTitle("WeSplit")
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
