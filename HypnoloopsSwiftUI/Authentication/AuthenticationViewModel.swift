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
    
    func createAccountTapped() {
        // Handle create account action here
        print("hi")
    }
    
    func loginButtonTapped() async {
        do {
            try await Task.sleep(until: .now + .seconds(3), clock: .continuous)
        } catch {
            print(error.localizedDescription)
        }
        print("Countdown completed!")
    }

}
