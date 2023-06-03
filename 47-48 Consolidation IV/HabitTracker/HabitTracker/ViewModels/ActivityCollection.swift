//
//  ActivityCollection.swift
//  HabitTracker
//
//  Created by Svidt on 03/06/2023.
//

import Foundation

class ActivityCollection: ObservableObject {
    @Published var instance = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(instance) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                instance = decodedItems
                return
            }
        }
    }
}
