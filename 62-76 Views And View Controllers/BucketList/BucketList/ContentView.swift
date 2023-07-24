//
//  ContentView.swift
//  BucketList
//
//  Created by Svidt on 24/07/2023.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
    User(firstName: "Kristian", lastName: "Svidt"),
    User(firstName: "Takyoung", lastName: "Woo"),
    User(firstName: "Jens", lastName: "Møller")
    ].sorted()
    
    var body: some View {
        VStack {
            List(users) { user in
                Text("\(user.firstName) \(user.lastName)")
            }
            
            Text("Hello World!")
                .onTapGesture {
                    let str = "Test Message"
                    let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                    
                    do {
                        try str.write(to: url, atomically: true, encoding: .utf8)
                        
                        let input = try String(contentsOf: url)
                        print(input)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            
        }
        .padding()
    }
    
    // Code snippet to get the local app directory
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
