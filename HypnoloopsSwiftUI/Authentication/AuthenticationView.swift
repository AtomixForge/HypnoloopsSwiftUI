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
        NavigationView {
            if viewModel.isLoggedIn {
                RecordView()
            } else {

                ZStack {
                    Color(.systemGray6)
                        .ignoresSafeArea()

                    VStack(spacing: 12) {
                        Image("loopLogo3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)

                        VStack(alignment: .leading, spacing: 16) {
                            TextField("Email", text: $viewModel.email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)

                            SecureField("Password", text: $viewModel.password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)

                        AsyncActionButton("Login") {
                            await viewModel.loginButtonTapped()
                        }
                        .buttonStyle(.authentication)
                        .padding(.horizontal)

                        NavigationLink(destination: ForgotPasswordView()) {
                            Text("Forgot Password?")
                                .foregroundColor(.blue)
                                .underline()
                        }

                        NavigationLink(destination: CreateAccountView()) {
                            Text("Create Account")
                                .foregroundColor(.blue)
                                .underline()
                        }
                    }
                    .padding()
                }
                .navigationBarHidden(true)
            }
        }
    }

    private func loginButtonTapped() async {
        await viewModel.loginButtonTapped()
    }
}

struct ForgotPasswordView: View {
    var body: some View {
        Text("Forgot Password View")
            .navigationBarTitle("Forgot Password", displayMode: .inline)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
