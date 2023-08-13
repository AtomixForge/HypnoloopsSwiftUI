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

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                CategoryView(viewModel: .init())
            })
        }
    }
}
