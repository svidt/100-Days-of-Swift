//
//  Activity.swift
//  HabitTracker
//
//  Created by Svidt on 03/06/2023.
//

import Foundation

struct Activity: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var description: String
    
}
