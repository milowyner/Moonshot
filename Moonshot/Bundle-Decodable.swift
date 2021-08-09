//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Milo Wyner on 8/8/21.
//

import Foundation

extension Bundle {
    func decode<DataType: Decodable>(_ file: String) -> [DataType] {
        guard let url = url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        guard let loaded = try? JSONDecoder().decode([DataType].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
