//
//  CreateAccountView.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 7/31/23.
//

import SwiftUI

struct CreateAccountView: View {
    @StateObject private var viewModel = CreateAccountViewModel()

    var body: some View {
        if viewModel.isLoggedIn {
            RecordView()
        } else {
            ZStack {
                Color("hlIndigo")
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(.white)
                        .overlay(
                            Image(systemName: "camera")
                                .resizable()
                                .foregroundStyle(Color.white)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                        )
                        .frame(width: 150)
                        .padding(.vertical, 24)

                    VStack(spacing: 16) {
                        TextField("Username", text: $viewModel.username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .foregroundColor(.black)

                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .foregroundColor(.black)

                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)

                    AsyncActionButton("Create Account") {
                        await viewModel.attemptCreateAccount(email: viewModel.email, password: viewModel.password)
                    }
                    .buttonStyle(.authentication)
                    .padding()

                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Create Account")
                        .font(.title.weight(.semibold))
                        .foregroundColor(.white)
                }
            }
            .hypnoAlert(presentAlert: $viewModel.isErrorPresented, alertType: .error(title: "Error", messages: [errorMessage]), leftButtonAction: nil, rightButtonAction: nil)
            .hypnoAlert(presentAlert: $viewModel.isValidationErrorsPresented, alertType: .error(title: "Invalid Form", messages: validationMessages), leftButtonAction: nil, rightButtonAction: nil)
        }
    }

    private var errorMessage: String {
        guard let message = viewModel.createAccountErrorMessage else {
            return "Invalid credentials"
        }
        return message
    }

    private var validationMessages: [String] {
        viewModel.validationErrorMessages.map { $0.rawValue }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
