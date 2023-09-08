//
//  practice_item.swift
//  Practice_enviroment
//
//  Created by Kristian Emil Hansen Svidt on 08/09/2023.
//

import Foundation

class practice_item: ObservableObject {
    @Published var name = "Name not updated"
    @Published var number = 0
    @Published var enrolled = false
}
