//
//  Mission.swift
//  MoonShoot
//
//  Created by Mahmoud Fouad on 7/7/21.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    let id: Int
    let crew: [Crew]
    private let launchDate: Date?
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
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
        
    }

    struct Crew: Codable {
        let name: String
        let role: String
        
    }
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

