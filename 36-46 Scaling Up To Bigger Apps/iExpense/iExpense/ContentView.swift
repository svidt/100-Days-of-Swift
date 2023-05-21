//
//  ContentView.swift
//  iExpense
//
//  Created by Svidt on 16/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack (alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .font(.subheadline)
                        }
                        Spacer()
                        VStack (alignment: .trailing) {
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            Text(item.date)
                                .font(.subheadline)
                            
                        }
                    }.listRowBackground( item.type == "Personal" ? LinearGradient(
                        gradient: Gradient(colors: [.white, .green.opacity(colorIntensity(amount: item.amount))]),
                        startPoint: .leading,
                        endPoint: .trailing) : LinearGradient(
                            gradient: Gradient(colors: [.white, .blue.opacity(colorIntensity(amount: item.amount))]),
                            startPoint: .leading,
                            endPoint: .trailing))
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .listRowSeparator(.hidden)
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
                //                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
    }
    
    func colorIntensity(amount: Double) -> Double {
        if amount >= 400.0 {
            return 1.0
        } else if amount >= 200 {
            return 0.8
        } else if amount >= 100 {
            return 0.6
        } else if amount >= 50 {
            return 0.4
        } else if amount >= 25 {
            return 0.2
        } else if amount >= 1 {
            return 0.1
        }
        return 0
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
