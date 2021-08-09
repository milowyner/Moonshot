//
//  ContentView.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/7/21.
//

import SwiftUI

struct ContentView: View {
//    @State private var astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    @State private var missions: [Mission] = Bundle.main.decode("missions")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: Text("Detail view")) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
