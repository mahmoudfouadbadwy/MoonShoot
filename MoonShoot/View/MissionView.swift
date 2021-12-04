//
//  MissionView.swift
//  MoonShoot
//
//  Created by Mahmoud Fouad on 7/7/21.
//

import SwiftUI

struct MissionView: View {
    
    private let mission: Mission
    private let crewMembers: [CrewMember]
    
    var body: some View {
        MissionDetails(mission: mission,
                       crewMembers: crewMembers)
    }
    
    init(mission: Mission) {
        self.mission = mission
        self.crewMembers = Helper.getCrewMembers(in: mission)
    }
}

struct MissionView_Previews: PreviewProvider {
    private static let missions = Helper.getMissions()
    
    static var previews: some View {
        MissionView(mission: missions[0])
    }
}
