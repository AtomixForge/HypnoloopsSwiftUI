//
//  HypnoValidationError.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/6/23.
//

import Foundation

enum  HypnoValidationError: String, Error {
    case passwordLength = "Password must be at least 7 characters long."
    case capitalLetter = "Password must contain at least one capital letter."
    case containNumber = "Password must contain at least one number."
    case specialCharacter = "Password must contain at least 1 special character."
    case invalidEmail = "Invalid email format"
}
