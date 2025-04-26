//
//  VetCard.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-24.
//

import SwiftUI

struct VetCard: View {
    var name: String
    var distance: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "cross.fill")
                    .foregroundColor(.blue)
                Text(name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .foregroundColor(.primary)
            }
            HStack(spacing: 4) {
                Image(systemName: "location.fill")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(distance)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}



#Preview {
    VetCard(name: "Happy Tails Clinic", distance: "1.2 km")
}

