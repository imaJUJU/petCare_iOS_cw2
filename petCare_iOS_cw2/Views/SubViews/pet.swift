//
//  pet.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-25.
//

import Foundation

struct Vaccination: Codable {
    let name: String
    let date: String
    let nextDue: String
}

struct Medication: Codable {
    let name: String
    let dose: String
    let startDate: String
    let endDate: String
}

struct Pet: Codable, Identifiable {
    let id: String
    let name: String
    let age: Int
    let weightKg: Double
    let gender: String
    let species: String
    let breed: String
    let vaccinations: [Vaccination]?
    let medications: [Medication]?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case age
        case weightKg
        case gender
        case species
        case breed
        case vaccinations
        case medications
    }
}
