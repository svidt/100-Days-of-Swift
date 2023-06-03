//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Kristian Emil Hansen Svidt on 03/06/2023.
//

import SwiftUI

struct AddActivity: View {
    
    @ObservedObject var activities: ActivityCollection
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var category = "Personal"
    @State private var description = ""
    
    @State private var buttonStateDisabled = true
    
    let categories = ["Personal", "Business", "Sports", "Beauty"]
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Add activity")
            .toolbar {
                Button("Save") {
                    let item = Activity(name: name, category: category, description: description)
                    activities.instance.append(item)
                    dismiss()
                    
                }
                .disabled(name == "" ? buttonStateDisabled == true : buttonStateDisabled == false)
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(activities: ActivityCollection())
    }
}
