//
//  HypnoError.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/6/23.
//

import Foundation

enum HypnoError: String, Error {
    case authenticatedUserError = "No user found"
    case networkError = "Network error occurred."
    case userDataError = "User data error occurred."
    case sectionHeadersError = "Section headers error occurred."
    case updateLikedAffirmationsError = "Update liked affirmations error occurred."
}

