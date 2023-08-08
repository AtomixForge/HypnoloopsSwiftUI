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
    @Published var authenticationErrorMessage: HypnoError?
    @Published var isLoggedIn = false
    private var networkManager = NetworkManager()
    
    func loginButtonTapped() async {
        do {
            try await networkManager.signInWithEmailPassword(email: email, password: password)
            isLoggedIn = true
        } catch {
            authenticationErrorMessage = HypnoError.signInError
        }
    }
}
