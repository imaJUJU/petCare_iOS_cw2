//
//  MainTabView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "pawprint.fill")
                }

            Mapview()
                .tabItem {
                    Label("Notifications", systemImage: "bell.fill")
                }

            PetDetailsView(petId:"680a4b97d8375ea92e1ff150")
                .tabItem {
                    Label("Profile", systemImage: "stethoscope")
                }

            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
