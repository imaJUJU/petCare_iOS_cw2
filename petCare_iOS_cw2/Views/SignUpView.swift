//
//  SignUpView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {

                // MARK: - App Title
                HStack(spacing: 0) {
                    Text("Pet")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primary)
                    Text(" Care")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.green)
                }
                .padding(.top, 40)

                // MARK: - Email Field
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)

                // MARK: - Password Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Create a password")
                        .font(.footnote)
                        .foregroundColor(.primary)

                    HStack {
                        if isPasswordVisible {
                            TextField("must be 8 characters", text: $password)
                        } else {
                            SecureField("must be 8 characters", text: $password)
                        }
                        Button(action: { isPasswordVisible.toggle() }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                }

                // MARK: - Confirm Password Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Confirm password")
                        .font(.footnote)
                        .foregroundColor(.primary)

                    HStack {
                        if isConfirmPasswordVisible {
                            TextField("repeat password", text: $confirmPassword)
                        } else {
                            SecureField("repeat password", text: $confirmPassword)
                        }
                        Button(action: { isConfirmPasswordVisible.toggle() }) {
                            Image(systemName: isConfirmPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                }

                // MARK: - Sign Up Button
                Button(action: {
                    // Handle sign-up logic
                }) {
                    Text("Sign up")
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .padding(.top, 8)

                // MARK: - Or Register With
                HStack {
                    Divider().frame(height: 1).background(Color.gray.opacity(0.3))
                    Text("Or Register with")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Divider().frame(height: 1).background(Color.gray.opacity(0.3))
                }
                .padding(.vertical, 4)

                // MARK: - Social Login Buttons
                HStack(spacing: 16) {
                    ForEach(["facebook", "google", "apple"], id: \.self) { provider in
                        Button(action: {
                            // Handle provider sign-up
                        }) {
                            Image(provider)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .padding()
                                .background(Color(UIColor.secondarySystemBackground))
                                .cornerRadius(12)
                                .frame(width: 60, height: 60)
                        }
                    }
                }

                Spacer()

                // MARK: - Already have an account
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.primary)
                        .font(.footnote)

                    NavigationLink(destination: /* LoginView() */ Text("Login Screen")) {
                        Text("Log in")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
                .padding(.bottom, 20)

            }
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    SignUpView()
}
