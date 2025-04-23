//
//  ReportView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI

struct ReportView: View {
    @State private var showConfirmation = false

    var petName: String = "Lilly"
    var lastSeenLocation: String = "Colombo 07"
    var petImage: Image = Image(systemName: "photo") 

    var body: some View {
        VStack(spacing: 30) {
            Text("Report Lost Pet")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            VStack(spacing: 15) {
                petImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .cornerRadius(16)
                    .shadow(radius: 6)

                Text("Pet Name: \(petName)")
                    .font(.headline)

                Text("Last Seen: \(lastSeenLocation)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.horizontal)

            Button(action: {
                showConfirmation = true
            }) {
                Text("Submit Report")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.headline)
            }
            .padding(.horizontal)
            .alert(isPresented: $showConfirmation) {
                Alert(
                    title: Text("Report Submitted"),
                    message: Text("Thank you! Your report has been successfully submitted."),
                    dismissButton: .default(Text("OK"))
                )
            }

            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
