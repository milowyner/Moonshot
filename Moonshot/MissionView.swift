//
//  MissionView.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/9/21.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let astronauts: [CrewMember]
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        
        self.astronauts = mission.crew.map { member in
            guard let match = astronauts.first(where: { $0.id == member.name }) else {
                fatalError("Missing \(member)")
            }
            
            return CrewMember(role: member.role, astronaut: match)
        }
    }
        
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    Text(mission.description)
                        .padding()
                    
                    ForEach(astronauts, id: \.role) { crewMember in
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 83, height: 60)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitle(mission.displayName, displayMode: .inline)
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    static var previews: some View {
        NavigationView {
            MissionView(mission: missions[1], astronauts: astronauts)
        }
    }
}
