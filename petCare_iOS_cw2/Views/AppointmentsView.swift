//
//  AppointmentsView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-23.
//

import SwiftUI

struct AppointmentsView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            // Top Navigation
            HStack {
                Button(action: {
                    // Back Action
                }) {
                    Text("Back")
                        .foregroundColor(.blue)
                }
                Spacer()
                Text("Appointments")
                    .font(.title2).bold()
                Spacer()
                Image(systemName: "bell.fill")
                    .foregroundColor(.blue)
            }
            .padding()

            // Calendar
            DatePicker(
                "Select Date",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .padding()

            // Upcoming Appointments
            Text("Upcoming Appointments")
                .font(.headline)
                .padding(.horizontal)

            VStack(spacing: 10) {
                AppointmentCard(title: "Vet Visit", date: "May 05, 2025")
                AppointmentCard(title: "Grooming", date: "April 20, 2025")
            }
            .padding(.horizontal)

            Spacer()
            
            // Book Button
            Button(action: {
                // Navigate to Booking Screen
            }) {
                Text("Book a new Appointment")
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

struct AppointmentCard: View {
    let title: String
    let date: String
    
    var body: some View {
        HStack {
            Image(systemName: "calendar")
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                Text(date)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    AppointmentsView()
}
