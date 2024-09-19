//
//  CrewMemberListView.swift
//  Moonshot
//
//  Created by Ismael Gorissen on 17/09/2024.
//

import SwiftUI

struct CrewMemberListView: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember.astronaut) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(Capsule().strokeBorder(.white, lineWidth: 1))
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationDestination(for: Astronaut.self) { astronaut in
            AstronautView(astronaut: astronaut)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission = missions[0]
    var crew = mission.crew.map { member in
        if let astronaut = astronauts[member.name] {
            return CrewMember(role: member.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }
    
    CrewMemberListView(crew: crew)
        .preferredColorScheme(.dark)
}
