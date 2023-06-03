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
                            NavigationLink(act.name) {
                                ActivityView()
                                
                            }
                        }
                    }
                    Button("Add one") {
                        showingAddActivity = true
                    }
                    .frame(width: 100, height: 100)
                    .background(.green)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    .bold()
                    .sheet(isPresented: $showingAddActivity) {
                        AddActivity(activities: ActivityCollection())
                            .presentationDragIndicator(.visible)
                    }
                }
                .navigationTitle("Activity List")
                
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
