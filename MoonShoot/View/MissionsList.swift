//
//  MissionsList.swift
//  MoonShoot
//
//  Created by Mahmoud Fouad on 7/8/21.
//

import SwiftUI

struct MissionsList: View {
    
    private let astronauts = Helper.getAstronauts()
    private let missions = Helper.getMissions()
    
    var body: some View {
        List(missions) { mission in
            NavigationLink(destination:
                            MissionView(mission: mission,
                                        astronauts: self.astronauts)) {
                Image(mission.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
                
                VStack(alignment: .leading) {
                    Text(mission.displayName)
                    Text(mission.formattedLaunchDate)
                }
            }
        }.navigationBarTitle("Moonshot")
    }
}

struct MissionsList_Previews: PreviewProvider {
    static var previews: some View {
        MissionsList()
    }
}
