//
//  AuthenticationButtonStyle.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 7/31/23.
//

import SwiftUI

struct AuthenticationButtonStyle: ButtonStyle {
    var isEnabled: Bool

    init(enabled: Bool) {
        isEnabled = enabled
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(background)
            .cornerRadius(8)
            .opacity(isEnabled ? 1.0 : 0.5)
    }

    private var background: Color {
        isEnabled ? Color("hlPurple") : .gray
    }
}

extension ButtonStyle where Self == AuthenticationButtonStyle {
    internal static var authentication: Self { .init(enabled: true) }
}

struct AuthenticationButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        AsyncActionButton("Test Button") {}
            .buttonStyle(.authentication)
    }
}
