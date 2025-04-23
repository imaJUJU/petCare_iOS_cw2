//
//  PetDetailsView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI

struct PetDetailsView: View {
    var body: some View {
        VStack(spacing: 16) {
            
            // Header
            HStack {
                Button(action: {
                    // Handle back action
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Text("Pet Profile")
                    .font(.title2).bold()
                
                Spacer()
                
                Button(action: {
                    // Handle notifications
                }) {
                    Image(systemName: "bell.fill")
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            
            // Pet Image
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.pink.opacity(0.3))
                        .frame(width: 120, height: 120)
                    
                    Image("dog") // replace with your image name
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 30, height: 30)
                        .overlay(Image(systemName: "plus")
                            .foregroundColor(.white)
                        )
                        .offset(x: 40, y: 40)
                }
                
                Text("Lilly")
                    .font(.title2)
                    .bold()
                Text("Shih tzu ~ 2 years old")
                    .foregroundColor(.gray)
            }
            .padding(.top)
            
            // Basic Info
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Basic Info")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle Edit
                    }) {
                        Text("Edit")
                            .foregroundColor(.gray)
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    infoItem(icon: "pawprint.fill", label: "Species", value: "Dog")
                    infoItem(icon: "birthday.cake.fill", label: "Birthday", value: "22/11/2022")
                    infoItem(icon: "scalemass.fill", label: "Weight", value: "7.2 kg")
                    infoItem(icon: "pencil", label: "Pet Name", value: "Lilies")
                    infoItem(icon: "figure.stand.line.dotted.figure.stand", label: "Sex", value: "Female")
                    infoItem(icon: "heart.fill", label: "Breed", value: "Shih Tzu")
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(20)
            .padding(.horizontal)
            
            Spacer()
        }
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
        PetDetailsView()
    }
}

