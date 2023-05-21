//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Svidt on 17/05/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let date: String
}
