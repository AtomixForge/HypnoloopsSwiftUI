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
    @Published var validationErrorMessages: [HypnoValidationError] = []
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


    private func isValidEmailFormat(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    private func isValidPasswordFormat(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{7,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }

    func validateEmail() {
        validationErrorMessages.removeAll()
        if !isValidEmailFormat(email) {
            validationErrorMessages.append(.invalidEmail)
        }
    }

    func validatePassword()  {
        validationErrorMessages.removeAll()
        if !isValidPasswordFormat(password) {
            if password.count < 7 {
                validationErrorMessages.append(.passwordLength)
            }

            if !password.contains(where: {$0.isUppercase} ) {
                validationErrorMessages.append(.capitalLetter)
            }

            if !password.contains(where: {$0.isNumber} ) {
                validationErrorMessages.append(.containNumber)
            }

            if !password.contains(where: { CharacterSet(charactersIn: "!@#$%^&*()-_=+[{]};:'\",.<>/?").contains($0.unicodeScalars.first!) }) {
                validationErrorMessages.append(.specialCharacter)
            }
        }
    }
}
