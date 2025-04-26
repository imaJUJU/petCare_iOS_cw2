//
//  ServiceTile.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-24.
//

import SwiftUI

struct ServiceTile: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())
                .shadow(radius: 4)

            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    ServiceTile(title: "Vet Care", icon: "stethoscope", color: .blue)
}

