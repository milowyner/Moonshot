//
//  ContentView.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var missions: [Mission] = Bundle.main.decode("missions")
    @State private var astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    @State private var showingCrew = false
    
    private func crewList(_ mission: Mission) -> String {
        return mission.crew.map { $0.name.capitalized }.joined(separator: ", ")
    }
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(showingCrew ? crewList(mission) : mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Button("Show \(showingCrew ? "launches" : "crew")") {
                showingCrew.toggle()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
