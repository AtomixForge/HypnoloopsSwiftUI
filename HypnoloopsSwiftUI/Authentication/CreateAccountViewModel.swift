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

    func createAccountButtonTapped() {
        
    }
}
