//
//  NavigationButton.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/11/23.
//

import SwiftUI

enum NavigationButtonType {
    case category
    case recording
    case settings
    case profile
}

struct NavigationButton: View {
    let type: NavigationButtonType

    var body: some View {
        NavigationLink(destination: destinationView) {
            Text(buttonTitle)
                .font(.headline)
                .frame(width: 100)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }

    private var destinationView: AnyView {
        switch type {
        case .category:
            return AnyView(CategoryView(viewModel: CategoryViewModel()))
        case .recording:
            return AnyView(RecordView())
        case .profile:
            return AnyView(Text("Profile"))
        case .settings:
            return AnyView(Text("Settings"))
        }
    }

    private var buttonTitle: String {
        switch type {
        case .category:
            return "Category"
        case .recording:
            return "Record"
        case .profile:
            return "Profile"
        case .settings:
            return "Settings"
        }
    }
}
