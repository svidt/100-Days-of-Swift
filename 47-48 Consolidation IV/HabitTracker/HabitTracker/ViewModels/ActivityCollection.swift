//
//  ActivityCollection.swift
//  HabitTracker
//
//  Created by Kristian Emil Hansen Svidt on 03/06/2023.
//

import Foundation

class ActivityCollection: ObservableObject {
    @Published var instance = [Activity]()
    
    
//    init() {
//        var newInstance = Activity(name: "Emil", category: "Sports", description: "Mixed Martial Arts")
//    }
    
}
