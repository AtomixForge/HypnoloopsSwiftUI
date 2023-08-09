//
//  NetworkManager.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/6/23.
//

import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import Foundation

class NetworkManager: NetworkManageable {
    func createUserWithEmailPassword(email: String, password: String) async throws {
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
        } catch {
            throw HypnoError.createUserError
        }
    }


    func signInWithEmailPassword(email: String, password: String) async throws {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
        } catch {
            throw HypnoError.signInError
        }
    }

    func fetchUserProfilImageURL() async throws -> URL {
        guard let uid = Auth.auth().currentUser?.uid else {
            throw HypnoError.authenticatedUserError
        }
        let storageReference = Storage.storage().reference().child("users").child(uid)

        do {
            let url = try await storageReference.downloadURL()
            return url
        } catch {
            throw error
        }
    }

    func fetchCurrentUserData() async throws -> UserData {
        guard let user = Auth.auth().currentUser else {
            throw HypnoError.authenticatedUserError
        }

        let reference = Database.database().reference()
        let userReference = reference.child("users").child(user.uid).child("likedAffirmations")

        do {
            let snapshot = try await userReference.getData()
            let likedAffirmations = snapshot.value as? [String] ?? []
            return UserData(username: user.displayName ?? "default", likedAffirmationIds: likedAffirmations)
        } catch {
            throw HypnoError.userDataError
        }


    }

    func updateLikedAffirmations(likedAffirmationIds: [String]) throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            throw HypnoError.authenticatedUserError
        }

        let reference = Database.database().reference()
        let affirmationIds = reference.child("users").child(uid).child("likedAffirmations")
        affirmationIds.setValue(likedAffirmationIds)
    }

    private func setValueAsync(_ ref: DatabaseReference, value: Any) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            ref.setValue(value) { error, reference in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: ())
                }
            }
        }
    }
}
