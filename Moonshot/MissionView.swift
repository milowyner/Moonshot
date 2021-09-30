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
    
    func size(outer: GeometryProxy, inner: GeometryProxy? = nil) -> CGFloat {
        var scale = 0.7
        if let inner = inner {
            scale *= inner.frame(in: .global).minY / 300.0
            if scale < 0 { scale = 0.0 }
            scale += 0.7 * 0.7
        }
        return outer.size.width * scale
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    GeometryReader { imageGeo in
                        Image(decorative: mission.image)
                            .resizable()
                            .scaledToFit()
                            .padding(.top)
                            .frame(size: size(outer: geometry, inner: imageGeo))
                            .position(x: imageGeo.size.width / 2, y: imageGeo.size.height - size(outer: geometry, inner: imageGeo) / 2)
                    }
                    .frame(size: size(outer: geometry))
                    
                    
                    Text(mission.formattedLaunchDate)
                        .font(.headline)
                        .padding(.top)
                    
                    Text(mission.description)
                        .padding()
                    
                    ForEach(astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
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
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarTitle(mission.displayName, displayMode: .inline)
        }
    }
}

extension View {
    func frame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    static var previews: some View {
        NavigationView {
            MissionView(mission: missions[0], astronauts: astronauts)
        }
    }
}
