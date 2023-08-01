//
//  AuthenticationButtonStyle.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 7/31/23.
//

import SwiftUI

struct AuthenticationButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .foregroundStyle(Color.white)
            .frame(maxWidth: 250)
            .padding(.horizontal, 12)
            .padding(.vertical)
            .background(Color.hlPurple)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)

    }
}

extension ButtonStyle where Self == AuthenticationButtonStyle {
    internal static var authentication: Self { .init() }
}

struct AuthenticationButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        AsyncActionButton("Test Button") {}
            .buttonStyle(.authentication)
    }
}
