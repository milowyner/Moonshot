//
//  MissionView.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/9/21.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    @State private var astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                Image(mission.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(mission.formattedLaunchDate)
                ForEach(0..<mission.crew.count) { crewIndex in
                    AstronautView(
                        astronaut: astronauts.first(where: { $0.id == mission.crew[crewIndex].name })!,
                        role: mission.crew[crewIndex].role
                    )
                }
                
                Text(mission.description)
            }
            .padding()
        }
        .navigationBarTitle(mission.displayName)
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MissionView(mission: (Bundle.main.decode("missions") as [Mission])[1])
        }
    }
}
