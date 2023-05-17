//
//  ContentView.swift
//  iExpense
//
//  Created by Svidt on 16/05/2023.
//

import SwiftUI

//class User: ObservableObject {
//    @Published var firstName: String = "Bilbo"
//    @Published var lastName: String = "Baggins"
//
//}

struct User: Codable {
    let firstName: String
    let lastName: String
}

//struct FirstView: View {
//    var body: some View {
//
//        @StateObject var user = User()
//
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
//        .padding()
//    }
//}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("tapCount") private var tapCount = 0
    
    let name: String
    
    var body: some View {
        Text("Hello \(name)")
        Button("Dismiss") {
            dismiss()
        }
        .padding()
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
            
        }
    }
}

struct ContentView: View {
    
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    @State private var showingSheet_1: Bool = false
    @State private var showingSheet_2: Bool = false
    
    @AppStorage("tapCount") private var tapCount = 0
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @State private var numbers = [Int]()
    @State private var currentNumber: Int = 1
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Button("Save User") {
                    let encoder = JSONEncoder()
                    
                    if let data = try? encoder.encode(user) {
                        UserDefaults.standard.set(data, forKey: "UserData")
                    }
                }
                
                Button("Tap Count: \(tapCount)") {
                    tapCount += 1
//                    UserDefaults.standard.set(tapCount, forKey: "Tap")
                    
                }
                
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                .padding(50)
                
                HStack(spacing: 20) {
//                    Button("Show First Sheet") {
//                        showingSheet_1.toggle()
//                    }
//                    .sheet(isPresented: $showingSheet_1) {
//                        FirstView()
//                    }
                    Button("Show Second Sheet") {
                        showingSheet_2.toggle()
                    }
                    .sheet(isPresented: $showingSheet_2) {
                        SecondView(name: "Svidt")
                    }
                }
                
            }
            .navigationTitle("Deleting Row")
            .toolbar {
                EditButton()
            }
            
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
