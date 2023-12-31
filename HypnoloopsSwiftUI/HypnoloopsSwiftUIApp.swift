//
//  HypnoloopsSwiftUIApp.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 7/30/23.
//

import SwiftUI
import Firebase

@main
struct HypnoloopsSwiftUIApp: App {
    @StateObject private var networkManager = NetworkManager()
    @StateObject private var dataImportManager = DataImportManager()
    

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup { homeView }
    }

    private var homeView: some View {
        Group {
            NavigationView {
                if Auth.auth().currentUser == nil {
                    AuthenticationView()
                        .environmentObject(networkManager)
                } else {
                    HypnoTabView()
                        .environmentObject(networkManager)
                        .environmentObject(dataImportManager)
                }
            }
        }
    }
}
