//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Svidt on 03/06/2023.
//

import SwiftUI

struct ActivityView: View {
//    @StateObject var activity = ActivityCollection()
//    @ObservedObject var activities: ActivityCollection
    
    let item: Activity

    var body: some View {
        
        VStack {
            Text("Hello \(item.name)")
            Text("Category: \(item.category)")
            Text(item.description)
            
        }
        
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(item: Activity(name: "Name", category: "Category", description: "Description"))
    }
}
