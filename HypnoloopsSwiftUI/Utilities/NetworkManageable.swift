//
//  NetworkManageable.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/6/23.
//

import Foundation

protocol NetworkManageable {
    func fetchUserProfilImageURL() async throws -> URL
    func fetchCurrentUserData() async throws -> UserData
    func updateLikedAffirmations(likedAffirmationIds: [String]) async throws
}
