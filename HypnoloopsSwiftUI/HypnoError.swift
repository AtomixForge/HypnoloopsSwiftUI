//
//  HypnoError.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/3/23.
//

import Foundation

enum HypnoError: Error {
    case userNotLoggedIn
    case failedToUpdateLikedAffirmations
    case invalidURL

    var localizedDescription: String {
        switch self {
        case .userNotLoggedIn:
            return "User is not logged in."
        case .failedToUpdateLikedAffirmations:
            return "Failed to update liked affirmations."
        case .invalidURL:
            return "Invalid URL."
        }
    }
}
