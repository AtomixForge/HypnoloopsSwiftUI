//
//  AuthenticationViewModel.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 7/30/23.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var authenticationErrorMessage: String?
    @Published var isLoggedIn = false
    @Published var isPresentingError = false

    private var networkManager = NetworkManager()

    var isValidForm: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    func attemptLogin() async {
        do {
            try await networkManager.signInWithEmailPassword(email: email, password: password)
            isLoggedIn = true
        } catch {
            authenticationErrorMessage = HypnoError.signInError.rawValue
            isPresentingError = true
        }
    }

}
