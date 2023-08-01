//
//  ContentView.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 7/30/23.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject private var viewModel = AuthenticationViewModel()

    var body: some View {
        VStack {
            VStack {
                logoImage
                authForm
                loginButton
                createAccountLink


            }
            .scaledToFit()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.hlIndigo)
    }

    private var logoImage: some View {
        Image("loopLogo3")
            .resizable()
            .frame(maxWidth: 300)
            .aspectRatio(contentMode: .fit)
    }

    private var authForm: some View {
        Form {
            Section {
                TextField("Username", text: $viewModel.email)
                TextField("Password", text: $viewModel.password)
            }
        }
        .background(Color.hlIndigo)
        .scrollContentBackground(.hidden)
    }

    private var loginButton: some View {
        AsyncActionButton("Login") {
            viewModel.loginButtonTapped()
        }
        .buttonStyle(.authentication)
    }

    private var createAccountLink: some View {
        NavigationLink(destination: CreateAccountView()) {
            Text("Create Account")
                .foregroundStyle(Color.white)
                .underline()
        }
    }
}

#Preview {
    AuthenticationView()
}
