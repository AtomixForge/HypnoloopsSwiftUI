//
//  CreateAccountViewModel.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 7/31/23.
//

import Foundation

final class CreateAccountViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var createAccountErrorMessage: String?
    @Published var validationErrorMessages: [HypnoValidationError] = []
    @Published var isValidationErrorsPresented = false
    @Published var isErrorPresented = false
    @Published var isLoggedIn = false
    
    private var networkManager = NetworkManager()

    func attemptCreateAccount(email: String, password: String) async {
        validateForm()  // Always validate the form before attempting to create an account
        if validationErrorMessages.isEmpty {
            do {
                try await networkManager.createUserWithEmailPassword(email: email, password: password)
                isLoggedIn = true
            } catch {
                createAccountErrorMessage = HypnoError.createUserError.rawValue
                isErrorPresented = true
            }
        } else {
            isValidationErrorsPresented = true
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

    func validateForm() {
        validationErrorMessages = []

        if !isValidEmailFormat(email) {
            validationErrorMessages.append(.invalidEmail)
        }

        if !isValidPasswordFormat(password) {
            if password.count < 7 {
                validationErrorMessages.append(.passwordLength)
            }

            if !password.contains(where: {$0.isUppercase}) {
                validationErrorMessages.append(.capitalLetter)
            }

            if !password.contains(where: {$0.isNumber}) {
                validationErrorMessages.append(.containNumber)
            }

            if !password.contains(where: {CharacterSet(charactersIn: "!@#$%^&*()-_=+[{]};:'\",.<>/?").contains($0.unicodeScalars.first!) }) {
                validationErrorMessages.append(.specialCharacter)
            }
        }

        isValidationErrorsPresented = true
    }

}
