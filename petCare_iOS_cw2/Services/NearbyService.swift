//
//  NearbyService.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-25.
//

import Foundation
import CoreLocation

struct NearbyService: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let type: String
    let reviews: [String]
    let contactInfo: String
    let hours: String
    
    enum CodingKeys: String, CodingKey {
        case name, type, coordinates, reviews, contactInfo, hours
    }

    enum CoordinateKeys: String, CodingKey {
        case latitude, longitude
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
        reviews = try container.decode([String].self, forKey: .reviews)
        contactInfo = try container.decode(String.self, forKey: .contactInfo)
        hours = try container.decode(String.self, forKey: .hours)

        let coordinates = try container.nestedContainer(keyedBy: CoordinateKeys.self, forKey: .coordinates)
        let latitude = try coordinates.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try coordinates.decode(CLLocationDegrees.self, forKey: .longitude)
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        

        print("Decoded service: \(name), \(latitude), \(longitude)")
    }

    init(name: String, coordinate: CLLocationCoordinate2D, type: String, reviews: [String], contactInfo: String, hours: String) {
        self.name = name
        self.coordinate = coordinate
        self.type = type
        self.reviews = reviews
        self.contactInfo = contactInfo
        self.hours = hours
    }
}

