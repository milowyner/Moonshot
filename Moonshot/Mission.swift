//
//  Mission.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/9/21.
//

import SwiftUI

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            return formatter.string(from: launchDate)
        } else {
            return "Never launched"
        }
    }
}
