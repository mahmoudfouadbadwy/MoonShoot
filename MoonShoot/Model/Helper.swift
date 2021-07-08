//
//  Helper.swift
//  MoonShoot
//
//  Created by Mahmoud Fouad on 7/8/21.
//

import Foundation

class Helper {
    
    private static let astronauts: [Astronaut] =  Bundle.main.decode("astronauts.json")
    private static let missions: [Mission] =   Bundle.main.decode("missions.json")
    
    static func getAstronauts() -> [Astronaut] { astronauts }
    static func getMissions() -> [Mission] { missions }
    
    static func getCrewMembers(in mission: Mission) -> [CrewMember] {
        mission.crew.map { member in
            astronauts
                .first { $0.id == member.name}
                .map { CrewMember(role: member.role, astronaut: $0) }!
        }
    }
    
    static func getMissions(for astronaut: Astronaut) -> [Mission] {
        missions.filter { !$0.crew.filter { $0.name == astronaut.id }.isEmpty }
    }
}
