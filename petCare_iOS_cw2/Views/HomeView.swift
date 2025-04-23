//
//  HomeView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search for services, vets...", text: $searchText)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(14)
                    .padding(.horizontal)

                    // Hero Section with Image & Modern Styling
                    ZStack(alignment: .leading) {
                        Image("dog_illustration")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 220)
                            .clipped()
                            .cornerRadius(20)
                            .overlay(
                                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
                                    .cornerRadius(20)
                            )

                        VStack(alignment: .leading, spacing: 8) {
                            Text("What Services do you Need?")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .shadow(radius: 4)

                            Button(action: {
                                // Navigate to services
                            }) {
                                Text("Get Started")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color(.systemBlue))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .shadow(radius: 4)
                            }
                        }
                        .padding()
                    }
                    .padding(.horizontal)

                    // Explore Services
                    Text("Explore Services")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.horizontal)

                    HStack(spacing: 24) {
                        ServiceItem(title: "Vet Care", imageName: "stethoscope", backgroundColor: Color(.systemBlue))
                        ServiceItem(title: "Grooming", imageName: "scissors", backgroundColor: Color(.systemPurple))
                        ServiceItem(title: "Training", imageName: "pawprint.fill", backgroundColor: Color(.systemGreen))
                    }
                    .padding(.horizontal)

                    // Nearby Vets Section
                    Text("Veterinary Near You")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.horizontal)

                    VStack(spacing: 16) {
                        VetCard(name: "Happy Paws Clinic", distance: "1.2 km")
                        VetCard(name: "Pet Health Centre", distance: "2.5 km")
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "bell")
                        .foregroundColor(.primary)
                }
            }
            .background(Color(.systemBackground))
        }
    }
}

// MARK: - Components

struct ServiceItem: View {
    let title: String
    let imageName: String
    let backgroundColor: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .font(.system(size: 32))
                .foregroundColor(.white)
                .padding()
                .background(backgroundColor)
                .clipShape(Circle())
                .shadow(radius: 5)
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct VetCard: View {
    let name: String
    let distance: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "cross.case.fill")
                .font(.system(size: 26))
                .foregroundColor(.white)
                .padding()
                .background(Color(.systemBlue))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(distance)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


