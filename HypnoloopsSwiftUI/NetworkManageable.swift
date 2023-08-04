//
//  NetworkManageable.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/3/23.
//

import Foundation

protocol NetworkManageable {
    func fetchUserProfilImageURL() async throws -> URL
//    func fetchCurrentUserData() async throws -> UserData
//    func fetchSections() async throws -> Result<[Section], HypnoError>
    func updateLikedAffirmations(with affirmationIds: [String]) async throws
}
