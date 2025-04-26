//
//  Mapview.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-23.
//

import SwiftUI
import MapKit
import CoreLocation

struct Mapview: View {
    @StateObject private var viewModel = LocationMapViewModel()
    @StateObject private var locationManager = LocationManager()

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.9271, longitude: 79.8612),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    @State private var selectedType = "Vet"
    @State private var searchText = ""
    @State private var selectedService: NearbyService? = nil
    @State private var travelTime: String = "Calculating..."

    let types = ["Vet", "Clinic", "Pharmacy", "Pet Shop"]

    var filteredServices: [NearbyService] {
        viewModel.services.filter {
            $0.type.localizedCaseInsensitiveContains(selectedType) &&
            (searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText))
        }
    }

    func getDirections(to service: NearbyService) {
        guard let userLocation = locationManager.userLocation else { return }

        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let servicePlacemark = MKPlacemark(coordinate: service.coordinate)

        let userMapItem = MKMapItem(placemark: userPlacemark)
        let serviceMapItem = MKMapItem(placemark: servicePlacemark)

        let request = MKDirections.Request()
        request.source = userMapItem
        request.destination = serviceMapItem
        request.transportType = .automobile

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let error = error {
                print("Error calculating directions: \(error.localizedDescription)")
                travelTime = "Unable to calculate time"
                return
            }

            if let route = response?.routes.first {
                let time = route.expectedTravelTime
                let minutes = Int(time / 60)
                DispatchQueue.main.async {
                    travelTime = "\(minutes) min"
                }
            }
        }
    }

    func imageForServiceType(_ type: String) -> String {
        switch type {
        case "Vet": return "vet_icon"
        case "Clinic": return "clinic_icon"
        case "Pharmacy": return "pharmacy_icon"
        case "Pet Shop": return "pet_shop_icon"
        default: return "default_icon"
        }
    }

    var body: some View {
        VStack {
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search by name...", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)

            // Filter Chips
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(types, id: \ .self) { type in
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

            // Map View with tapable annotations
            Map(coordinateRegion: $region, annotationItems: filteredServices) { service in
                MapAnnotation(coordinate: service.coordinate) {
                    Button(action: {
                        selectedService = service
                        getDirections(to: service)
                    }) {
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
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationTitle("Find Nearby Services")
        .onAppear {
            viewModel.fetchServices()
        }
        .sheet(item: $selectedService) { service in
            VStack(spacing: 16) {
                Image(imageForServiceType(service.type))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()

                Text(service.name)
                    .font(.title)
                    .bold()

                Text("Type: \(service.type)")
                    .font(.subheadline)

                Text("Location:")
                    .font(.footnote)

                Text("Lat: \(service.coordinate.latitude), Lon: \(service.coordinate.longitude)")
                    .font(.caption)
                    .foregroundColor(.gray)

                Text("Estimated Travel Time: \(travelTime)")
                    .font(.subheadline)
                    .padding(.top)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Mapview()
}
