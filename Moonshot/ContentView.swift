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
        List(missions) {
            Text($0.description)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
