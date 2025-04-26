//
//  SignUpView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = AuthViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {

                // MARK: - Title
                HStack(spacing: -5) {
                    Text("Pet")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primary)
                    Text(" Care")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.green)
                }
                .padding(.top, 40)

                // MARK: - Email
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)

                // MARK: - Password
                SecureField("Create a password (min 8 characters)", text: $viewModel.password)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)

                // MARK: - Confirm Password
                SecureField("Confirm password", text: $viewModel.confirmPassword)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)

                // MARK: - Error Message
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                }

                // MARK: - Sign Up Button
                Button(action: {
                    viewModel.registerUser()
                }) {
                    Text("Sign up")
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                NavigationLink(destination: HomeView(), isActive: $viewModel.signUpSuccess) {
                    EmptyView()
                }

                Spacer()

                // MARK: - Already have an account
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.primary)
                        .font(.footnote)

                    NavigationLink(destination: LoginView()) {
                        Text("Log in")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
            .alert(isPresented: $viewModel.signUpSuccess) {
                Alert(title: Text("Success"), message: Text("Registration complete!"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    SignUpView()
}
