//
//  Mapview.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-23.
//

import SwiftUI
import MapKit

struct NearbyService: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let type: String
}

struct Mapview: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.9271, longitude: 79.8612), // Default to Colombo
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @State private var selectedType = "Vet"
    @State private var searchText = ""
    
    let types = ["Vet", "Clinic", "Pharmacy", "Pet Shop"]
    
    let services: [NearbyService] = [
        NearbyService(name: "Happy Paws Vet", coordinate: CLLocationCoordinate2D(latitude: 6.9275, longitude: 79.8612), type: "Vet"),
        NearbyService(name: "Pet Care Clinic", coordinate: CLLocationCoordinate2D(latitude: 6.925, longitude: 79.86), type: "Clinic"),
        NearbyService(name: "Furry Pharmacy", coordinate: CLLocationCoordinate2D(latitude: 6.928, longitude: 79.863), type: "Pharmacy"),
        NearbyService(name: "Pet World Shop", coordinate: CLLocationCoordinate2D(latitude: 6.929, longitude: 79.865), type: "Pet Shop")
    ]
    
    var filteredServices: [NearbyService] {
        services.filter {
            $0.type == selectedType &&
            (searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText))
        }
    }
    
    var body: some View {
        VStack {
            // Search bar
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search by name...", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            // Filter chips
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(types, id: \.self) { type in
                        Button(action: { selectedType = type }) {
                            Text(type)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(selectedType == type ? Color.blue : Color.gray.opacity(0.2))
                                .foregroundColor(selectedType == type ? .white : .primary)
                                .cornerRadius(20)
                        }
                    }
                }
                .padding(.horizontal)
            }

            // Map
            Map(coordinateRegion: $region, annotationItems: filteredServices) { service in
                MapAnnotation(coordinate: service.coordinate) {
                    VStack {
                        Image(systemName: "pawprint.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                        Text(service.name)
                            .font(.caption2)
                            .padding(4)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(6)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationTitle("Find Nearby Services")
    }
}


#Preview {
    Mapview()
}
