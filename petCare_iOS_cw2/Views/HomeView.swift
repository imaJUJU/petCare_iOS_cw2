//
//  HomeView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var userName: String = "Pet Lover" // You can change or fetch dynamically later

    var greetingText: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12: return "Good Morning"
        case 12..<17: return "Good Afternoon"
        case 17..<22: return "Good Evening"
        default: return "Welcome Back"
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // Top Greeting and Search Bar
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("👋 \(greetingText),")
                                    .font(.title3.weight(.semibold))
                                    .foregroundColor(.primary)
                            }

                            Spacer()

                            Button(action: {
                                // Notification button action
                            }) {
                                Image(systemName: "bell.fill")
                                    .font(.title2)
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .padding(.horizontal)

                        // Search Bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search for vets, food, clinics...", text: $searchText)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(14)
                        .padding(.horizontal)
                    }
                    .padding(.top)

                    // Quick Access
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Quick Access")
                            .font(.headline)
                            .padding(.horizontal)

                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 24) {
                            QuickAccessTile(title: "Appointments", systemImage: "calendar.badge.plus")
                            QuickAccessTile(title: "Map", systemImage: "map.fill")
                            QuickAccessTile(title: "Lost & Found", systemImage: "pawprint.fill")
                            QuickAccessTile(title: "Settings", systemImage: "gearshape.fill")
                        }
                        .padding(.horizontal)
                    }

                    // Featured Clinics
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Featured Clinics")
                            .font(.headline)
                            .padding(.horizontal)

                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            VetCard(name: "Happy Paws Clinic", distance: "1.2 km")
                            VetCard(name: "Pet Wellness Center", distance: "2.8 km")
                            VetCard(name: "Furry Friends Hospital", distance: "3.5 km")
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Home")
        }
    }
}

struct QuickAccessTile: View {
    var title: String
    var systemImage: String

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(Color.accentColor.opacity(0.9))
                    .frame(width: 60, height: 60)

                Image(systemName: systemImage)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            Text(title)
                .font(.caption)
                .foregroundColor(.primary)
        }
    }
}


// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



