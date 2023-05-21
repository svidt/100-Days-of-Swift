//
//  AddView.swift
//  iExpense
//
//  Created by Svidt on 17/05/2023.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount  = 0.0
    @State private var date = ""
    
    @State private var buttonStateDisabled = true
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter
        }()
    
    let types = ["Business", "Personal"]
    
    var formattedCurrentDate: String {
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                } footer: {
                    HStack {
                        Spacer()
                        Text(formattedCurrentDate)
                    }
                    
                }
                
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, date: date )
                    expenses.items.append(item)
                    dismiss()
                }
                .disabled(name == "" ? buttonStateDisabled == true : buttonStateDisabled == false)
            }
            
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
