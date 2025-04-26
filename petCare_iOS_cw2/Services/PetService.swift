//
//  PetService.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-25.
//

import Foundation

class PetService {
    static let shared = PetService()
    private init() {}

    func fetchPet(by id: String, completion: @escaping (Result<Pet, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/api/pets/\(id)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1)))
                return
            }

            do {
                let pet = try JSONDecoder().decode(Pet.self, from: data)
                completion(.success(pet))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
