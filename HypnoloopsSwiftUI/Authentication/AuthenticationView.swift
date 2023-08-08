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
                                .onChange(of: viewModel.email) { email in
                                    viewModel.validateEmail()
                                }

                            SecureField("Password", text: $viewModel.password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .onChange(of: viewModel.password) { password in
                                    viewModel.validatePassword()
                                }
                        }
                        .padding(.horizontal)

                        if !viewModel.validationErrorMessages.isEmpty {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                errorMessagesView
                                    .frame(maxWidth: .infinity ,maxHeight: calculateErrorViewHeight())
                                    .padding(.horizontal)
                                    .transition(.opacity)
                            }
                        }

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

    private var errorMessagesView: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.validationErrorMessages, id: \.self) { error in
                Text("• \(error.rawValue)")
                    .foregroundColor(.red)
                    .font(.body )
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.horizontal)
    }

    private func calculateErrorViewHeight() -> CGFloat {
        let singleLineHeight: CGFloat = 20
        let totalHeight = CGFloat(viewModel.validationErrorMessages.count) * singleLineHeight
        let minHeight: CGFloat = 40
        return max(totalHeight, minHeight)
    }

    private func loginButtonTapped() async {
        do {
            try await viewModel.loginButtonTapped()
        }
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
