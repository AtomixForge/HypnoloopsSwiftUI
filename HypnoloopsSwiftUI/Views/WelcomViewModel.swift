//
//  WelcomViewModel.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/11/23.
//

import Foundation

struct WelcomeViewModel {
    private var networkManager = NetworkManager()
    let navigationButtonTypes: [NavigationButtonType] = [.category, .recording, .settings, .profile]
}
