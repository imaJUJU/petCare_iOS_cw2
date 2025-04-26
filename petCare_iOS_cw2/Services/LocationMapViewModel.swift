//
//  LocationMapViewModel.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-25.
//

import Foundation

class LocationMapViewModel: ObservableObject {
    @Published var services: [NearbyService] = []

    func fetchServices() {
        guard let url = URL(string: "http://localhost:8080/api/locations") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode([NearbyService].self, from: data)
                    DispatchQueue.main.async {
                        self.services = decoded
                    }
                } catch {
                    print("Decoding error:", error)
                }
            } else if let error = error {
                print("Network error:", error)
            }
        }.resume()
    }
}
