//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Svidt on 19/06/2023.
//


import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFiler = "A"
    
    var body: some View {
        VStack {
                // list of matching singers
            FilteredList(filter: lastNameFiler)
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                taylor.firstName = "Ed"
                taylor.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                taylor.firstName = "Adele"
                taylor.lastName = "Adkins"
                
                try? moc.save()
            }
            
            
            
//            Button("Save") {
//                if moc.hasChanges {
//                    try? moc.save()
//                }
//            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
