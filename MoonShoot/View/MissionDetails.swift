//
//  MissionDetails.swift
//  MoonShoot
//
//  Created by Mahmoud Fouad on 7/8/21.
//

import SwiftUI

struct MissionDetails: View {
    
    private let mission: Mission
    private let crewMembers: [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.7)
                        .padding(.top)
                    
                    Text(mission.formattedLaunchDate)
                    
                    Text(mission.description)
                        .padding()
                    
                    ForEach(self.crewMembers, id: \.role) { crewMember in
                        NavigationLink(destination:
                                        AstronautView(astronaut: crewMember.astronaut)){
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                    
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer(minLength: 25)
                }
            }
            .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
            
        }
    }
    init(mission: Mission, crewMembers: [CrewMember]) {
        self.mission = mission
        self.crewMembers = crewMembers
    }
}

struct MissionDetails_Previews: PreviewProvider {
    static let missions = Helper.getMissions()
    static let crewMembers = Helper.getCrewMembers(in: missions[0])
    static var previews: some View {
        MissionDetails(mission: missions[0],
                       crewMembers: crewMembers)
    }
}
