//
//  AstronautScrollView.swift
//  Moonshot
//
//  Created by Svidt on 25/05/2023.
//

import SwiftUI

struct AstronautScrollView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut

    }
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }        
    }
}

//struct AstronautScrollView_Previews: PreviewProvider {
//    static let missions: [Mission] = Bundle.main.decode("missions.json")
//    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//
//    static var previews: some View {
//        AstronautScrollView()
//            .preferredColorScheme(.dark)
//    }
//}
