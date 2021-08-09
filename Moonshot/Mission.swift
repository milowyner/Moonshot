//
//  Mission.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/9/21.
//

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
