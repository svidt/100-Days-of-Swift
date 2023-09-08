//
//  practice_view.swift
//  Practice_enviroment
//
//  Created by Kristian Emil Hansen Svidt on 08/09/2023.
//

import SwiftUI

struct practice_view: View {
    
    @ObservedObject var item: practice_item
    
    var body: some View {
        
        VStack {
            Text(item.enrolled ? "Enrolled" : "Not enrolled")
            HStack(spacing: 50) {
                Button {
                    item.number += 1
                } label: {
                    Label("Incremental", systemImage: "plus")
                }
                
                Button {
                    item.number -= 1
                } label: {
                    Label("Decremental", systemImage: "minus")
                }
                
            }
        }
        
    }
}

struct practice_view_Previews: PreviewProvider {
    static var previews: some View {
        practice_view(item: practice_item())
    }
}
