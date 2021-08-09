//
//  ContentView.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    var body: some View {
        List(astronauts) {
            Text($0.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
