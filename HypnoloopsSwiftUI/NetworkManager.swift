//
//  NetworkManager.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/3/23.
//

import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
import FirebaseStorage
import Foundation

class NetworkManager: NetworkManageable {
    func fetchUserProfilImageURL() async throws -> URL {
        guard let currentUser = Auth.auth().currentUser else {
            throw HypnoError.userNotLoggedIn
        }

        let storageRef = Storage.storage().reference().child("users").child(currentUser.uid).child("profile.jpg")

        do {
            let url = try await storageRef.downloadURL()
            return url
        } catch {
            throw HypnoError.invalidURL
        }
    }
    
    func updateLikedAffirmations(with affirmationIds: [String]) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            throw HypnoError.userNotLoggedIn
        }

        let reference = Database.database().reference()
        let userReference = reference.child("users").child(uid)

        let updates = ["likedAffirmations": affirmationIds]

        do {
            try await userReference.updateChildValues(updates)
        } catch {
            throw HypnoError.failedToUpdateLikedAffirmations
        }
    }
    

}
