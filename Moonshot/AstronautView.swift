//
//  AstronautView.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/9/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let role: String
    
    var body: some View {
        HStack {
            Image(astronaut.id)
                .resizable()
                .scaledToFit()
                .frame(height: 60)
            VStack(alignment: .leading) {
                Text(astronaut.name)
                    .font(.headline)
                Text(role)
            }
            Spacer()
        }
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautView(astronaut: (Bundle.main.decode("astronauts") as [Astronaut]).first!, role: "Command Pilot")
    }
}
