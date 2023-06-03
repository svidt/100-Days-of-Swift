//
//  ContentView.swift
//  HabitTracker
//
//  Created by Svidt on 03/06/2023.
//


// MARK: Description
/*
 Build a habit-tracking app.
 
 Functionality:
 - Add activity
 - With a title and a description
 - Tapping into the activity to read description
 - Button to increment how many times activity has been completed.
 
 BONUS
 - Adding dates
 */

import SwiftUI

struct ContentView: View {
    
    @StateObject var activity = ActivityCollection()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    List {
                        ForEach(activity.instance) { act in
                            
                            NavigationLink {
                                ActivityView(item: Activity(name: act.name, category: act.category, description: act.description))
                            
                            } label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(act.name)
                                            .font(.headline)
                                        Text(act.category)
                                            .font(.subheadline)
                                        
                                    }
                                }
                            }
                        }
                        .onDelete(perform: removeActivity)
                        
                    }
                    
                }
                .navigationTitle("Activity List")
                .toolbar {
                    EditButton()
                }
                
                VStack {
                    Spacer()
                    
                    Button {
                        showingAddActivity = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .frame(width: 75, height: 75)
                    .background(.green)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    .imageScale(.large).bold()
                    .sheet(isPresented: $showingAddActivity) {
                        AddActivity(activities: activity)
                            .presentationDragIndicator(.visible)
                    }
                }
                
                
            }
        }
    }
    
    func removeActivity(at offsets: IndexSet) {
        activity.instance.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
