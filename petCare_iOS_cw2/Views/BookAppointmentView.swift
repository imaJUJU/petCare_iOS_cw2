//
//  BookAppointmentView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-23.
//

import SwiftUI

struct BookAppointmentView: View {
    @State private var selectedDate = Date()
    @State private var selectedVet = ""
    @State private var notes = ""
    
    let vets = ["Dr. Purwi Vithanage", "Dr. Kasun Pathirana"]
    
    var body: some View {
        VStack(alignment: .leading) {
            // Top Navigation
            HStack {
                Button(action: {}) {
                    Text("Back")
                        .foregroundColor(.blue)
                }
                Spacer()
                Text("Book a New Appointment")
                    .font(.title3).bold()
                Spacer()
                Image("pet-avatar") // Replace with your avatar
                    .resizable()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            }
            .padding()

            // Date Picker
            Text("Select Date and Time")
                .font(.headline)
                .padding(.horizontal)
            DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .padding(.horizontal)

            // Vet Selection
            Text("Choose a Veterinarian")
                .font(.headline)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(vets, id: \.self) { vet in
                        Button(action: {
                            selectedVet = vet
                        }) {
                            VStack {
                                Text(vet)
                                    .foregroundColor(.black)
                                    .bold()
                                Text("1.3km away")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(width: 160)
                            .background(selectedVet == vet ? Color.green.opacity(0.3) : Color.gray.opacity(0.2))
                            .cornerRadius(16)
                        }
                    }
                }.padding(.horizontal)
            }

            // Notes Field
            Text("Additional Notes")
                .font(.headline)
                .padding(.horizontal)
            TextField("Enter any details...", text: $notes)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)

            Spacer()

            // Confirm Button
            Button(action: {
                // Confirm Action
            }) {
                Text("Confirm Appointment")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .padding(.bottom)
        }
    }
}


#Preview {
    BookAppointmentView()
}
