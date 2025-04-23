//
//  WelcomeView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer()

                Image("dog4")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)

                    HStack(spacing: 0) {
                        Text("Pet")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        Text("Care")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }

                    Text("Your companion for responsible and caring pet ownership.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Spacer()

                    NavigationLink(destination: LoginView()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                            .padding(.horizontal, 40)
                    }
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
