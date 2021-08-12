//
//  AstronautView.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/12/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        let allMissions: [Mission] = Bundle.main.decode("missions")
        
        self.missions = allMissions.filter { mission in
            mission.crew.contains { crewRole in
                crewRole.name == astronaut.id
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ForEach(missions) { mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                            
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.crew.first {
                                    $0.name == astronaut.id
                                }!.role)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarTitle(astronaut.name, displayMode: .inline)
        }
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    static var previews: some View {
        NavigationView {
            AstronautView(astronaut: astronauts[1])
        }
    }
}
