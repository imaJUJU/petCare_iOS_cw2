//
//  AuthViewModel.swift
//  petCare_iOS_cw2
//
//  Created by Imanthi Abeyratne on 2025-04-25.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    // Shared fields
    @Published var email: String = ""
    @Published var password: String = ""

    // Sign-up specific
    @Published var confirmPassword: String = ""
    @Published var signUpSuccess: Bool = false

    // Login specific
    @Published var loginSuccess: Bool = false

    // Shared error handling
    @Published var errorMessage: String?

    // MARK: - Register User
    func registerUser() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email or password cannot be empty."
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }

        AuthService.shared.register(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.signUpSuccess = true
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    // MARK: - Login User

        func loginUser() {
            AuthService.shared.login(email: email, password: password) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success:
                        self?.loginSuccess = true
                        self?.errorMessage = nil
                    case .failure(let error):
                        self?.loginSuccess = false
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    

}
