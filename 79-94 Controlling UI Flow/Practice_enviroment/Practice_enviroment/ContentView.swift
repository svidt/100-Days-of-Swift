//
//  ContentView.swift
//  Practice_enviroment
//
//  Created by Kristian Emil Hansen Svidt on 08/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var info = practice_item()
    @State var animatedSize = 1.5
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(info.number)")
                    .font(.largeTitle)
                HStack {
                    Text("\(info.name)")
                    Image(systemName: info.enrolled == true ? "checkmark.circle.fill" : "checkmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Button("-") {
                        animatedSize -= 0.5
                    }
                    Button {
                        info.enrolled.toggle()
                    } label: {
                        Image(systemName: "paperplane.fill").scaleEffect(CGSize(width:
                        animatedSize, height: animatedSize))
                            .frame(width: 50, height: 50)
                    }
                    .padding(10)
                    .background(.green)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    
                    Button("+") {
                        animatedSize += 0.5
                    }
                }
                
                NavigationLink(destination: practice_view(item: info), label: { Text("Enter here")
                })
                .disabled(info.enrolled == true ? false : true)
                NavigationLink(destination: practice_view(item: info), label: { Text("Sneak peak..")})
                
            }
            
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
