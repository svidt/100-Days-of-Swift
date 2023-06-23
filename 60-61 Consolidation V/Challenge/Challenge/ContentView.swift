//
//  ContentView.swift
//  Challenge
//
//  Created by Svidt on 23/06/2023.
//

import SwiftUI

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
}

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    
    func fetchUsers() {
        guard users.isEmpty else { return }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let result = try decoder.decode([User].self, from: data)
                
                DispatchQueue.main.async {
                    self.users = result
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct ContentView: View {
    @StateObject private var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.isActive ? "Active" : "Inactive")
                            .foregroundColor(user.isActive ? .green : .red)
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: \(user.name)")
            Text("Age: \(user.age)")
            Text("Company: \(user.company)")
            Text("Email: \(user.email)")
            Text("Address: \(user.address)")
            Text("About: \(user.about)")
            Text("Registered: \(formatDate(user.registered))")
            Text("Tags: \(user.tags.joined(separator: ", "))")
            
            if !user.friends.isEmpty {
                Text("Friends:")
                    .font(.headline)
                
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("User Details")
    }
    
    func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .medium
            outputFormatter.timeStyle = .medium
            return outputFormatter.string(from: date)
        } else {
            return dateString
        }
    }
}

#Preview {
    ContentView()
}
