//
//  AstronautView.swift
//  MoonShoot
//
//  Created by Mahmoud Fouad on 7/7/21.
//

import SwiftUI

struct AstronautView: View {
    private let astronaut: Astronaut
    private let astronautMissions: [Mission]
    private var missions: String {
        self.astronautMissions.map {
            $0.displayName
        }.joined(separator: " - ")
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Divider()
                    
                    Text("Missions")
                        .font(.headline)
                        .padding([.horizontal, .top])
                    
                    Text(missions)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                       
                }
            }
            .navigationBarTitle(Text(astronaut.name),
                                displayMode: .inline)
        }
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        self.astronautMissions = Helper.getMissions(for: astronaut)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
