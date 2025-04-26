//
//  LoginView.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-21.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                
                // MARK: - App Title
                HStack(spacing: 0) {
                    Text("Pet")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primary)
                    Text("Care")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.green)
                }
                .padding(.top, 40)

                // MARK: - Email Field
                HStack {
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)

                    if !viewModel.email.isEmpty {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(12)

                // MARK: - Password Field
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $viewModel.password)
                    } else {
                        SecureField("Password", text: $viewModel.password)
                    }

                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(12)

                // MARK: - Login Button
                Button(action: {
                    viewModel.loginUser()
                }) {
                    Text("Log in")
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }

                .padding(.top, 8)

                // MARK: - Error Message
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                NavigationLink(destination: MainTabView(), isActive: $viewModel.loginSuccess) {
                    EmptyView()
                }

                // MARK: - Forgotten Password
                Button(action: {
                    // Handle password reset
                }) {
                    Text("Forgotten password?")
                        .font(.footnote)
                        .foregroundColor(.primary)
                }

                // MARK: - Or Login With Divider
                HStack {
                    Divider().frame(height: 1).background(Color.gray.opacity(0.3))
                    Text("Or Login with")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Divider().frame(height: 1).background(Color.gray.opacity(0.3))
                }
                .padding(.vertical, 4)

                // MARK: - Social Login Buttons
                HStack(spacing: 16) {
                    ForEach(["facebook", "google", "apple"], id: \.self) { provider in
                        Button(action: {
                            // Handle provider login
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

                // MARK: - Create New Account
                NavigationLink(destination: SignUpView()) {
                    Text("Create new account")
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                .padding(.bottom, 20)

            }
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    LoginView()
}

