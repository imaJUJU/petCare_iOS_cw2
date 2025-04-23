//
//  SettingsView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("notificationsEnabled") private var notificationsEnabled = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Preferences")) {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                    Toggle("Notifications", isOn: $notificationsEnabled)
                }

                Section(header: Text("Account")) {
                    NavigationLink(destination: ProfileView()) {
                        Label("Profile", systemImage: "person.circle")
                    }
                }

                Section(header: Text("Information")) {
                    NavigationLink(destination: HomeView()) {
                        Label("About", systemImage: "info.circle")
                    }

                    NavigationLink(destination: ReportView()) {
                        Label("Privacy Policy", systemImage: "lock.circle")
                    }
                }

                Section {
                    Button(role: .destructive) {
                        // logout logic here
                    } label: {
                        Label("Log Out", systemImage: "arrow.backward.circle")
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}


#Preview {
    SettingsView()
}
