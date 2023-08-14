//
//  ProfileView.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/13/23.
//

import Firebase
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var networkManager: NetworkManager
    @State private var showAuthenticationView = false

    var body: some View {
        Button("Logout") {
            do {
                try networkManager.signOut()
                showAuthenticationView = true
            } catch {
                print("error: \(error)")
            }
        }
        .fullScreenCover(isPresented: $showAuthenticationView) {
            AuthenticationView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
