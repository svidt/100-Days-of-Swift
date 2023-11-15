//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Svidt on 24/10/2023.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@svidt")
                    .alignmentGuide(.midAccountAndName) { dimension in dimension[VerticalAlignment.center] }
                Image("drone-show")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("emil svidt")
                    .alignmentGuide(.midAccountAndName) { dimension in dimension[VerticalAlignment.center] }
                    .textCase(.uppercase)
                    .font(.largeTitle)
            }
            
        }
    }
}
    
    #Preview {
        ContentView()
    }
