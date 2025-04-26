//
//  PetDetailsView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI

struct PetDetailsView: View {
    let petId: String
    @State private var pet: Pet?
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 16) {
            if isLoading {
                ProgressView("Loading...")
            } else if let pet = pet {
                petHeaderView(pet: pet)
                petBasicInfo(pet: pet)

                if let vaccinations = pet.vaccinations, !vaccinations.isEmpty {
                    vaccinationSection(vaccinations)
                }

                if let medications = pet.medications, !medications.isEmpty {
                    medicationSection(medications)
                }


                Spacer()
            } else if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            fetchPet()
        }
        .padding()
    }

    func fetchPet() {
        PetService.shared.fetchPet(by: petId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pet):
                    self.pet = pet
                    self.isLoading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }

    func petHeaderView(pet: Pet) -> some View {
        VStack {
      
            Image("dog5")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .foregroundColor(.gray)

            Text(pet.name)
                .font(.title2)
                .bold()
            Text("\(pet.breed) ~ \(pet.age) years old")
                .foregroundColor(.gray)
        }
    }

    func petBasicInfo(pet: Pet) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Basic Info")
                .font(.headline)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                infoItem(icon: "birthday.cake.fill", label: "Age", value: "\(pet.age) years")
                infoItem(icon: "scalemass.fill", label: "Weight", value: "\(pet.weightKg) kg")
                infoItem(icon: "figure.stand.line.dotted.figure.stand", label: "Gender", value: pet.gender)
                infoItem(icon: "pawprint.fill", label: "Species", value: pet.species)
                infoItem(icon: "heart.fill", label: "Breed", value: pet.breed)
                infoItem(icon: "pencil", label: "Pet Name", value: pet.name)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
    }

    func vaccinationSection(_ vaccinations: [Vaccination]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Vaccinations")
                .font(.headline)
            ForEach(vaccinations, id: \.name) { vaccination in
                Text("• \(vaccination.name) - Next due: \(vaccination.nextDue)")
                    .font(.subheadline)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .padding(.horizontal)
    }


    func medicationSection(_ medications: [Medication]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Medications")
                .font(.headline)
            ForEach(medications, id: \.name) { medication in
                Text("• \(medication.name), Dose: \(medication.dose), From: \(medication.startDate) to \(medication.endDate)")
                    .font(.subheadline)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .padding(.horizontal)
    }

    func infoItem(icon: String, label: String, value: String) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
            Text(label)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(value)
                .font(.subheadline)
                .bold()
        }
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsView(petId: "680a4b97d8375ea92e1ff150")
    }
}



