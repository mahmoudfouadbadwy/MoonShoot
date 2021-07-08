//
//  ContentView.swift
//  MoonShoot
//
//  Created by Mahmoud Fouad on 7/7/21.
//

import SwiftUI

struct MissionsView: View {
    var body: some View {
        NavigationView {
            MissionsList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MissionsView()
    }
}
