//
//  AstronautView.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/12/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
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
