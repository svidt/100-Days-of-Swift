//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Kristian Emil on 20/12/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to Snowseeker")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu. Swipe from the left edge to show it.")
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
