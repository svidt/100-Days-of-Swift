//
//  Prospect.swift
//  HotProspects
//
//  Created by Svidt on 24/08/2023.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name =  "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = []
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
