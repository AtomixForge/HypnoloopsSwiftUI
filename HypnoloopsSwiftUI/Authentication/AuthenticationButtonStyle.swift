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
            .foregroundStyle(.white)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("hlPurple"))
            .cornerRadius(8)

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
