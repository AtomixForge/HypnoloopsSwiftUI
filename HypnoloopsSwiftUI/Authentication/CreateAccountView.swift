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
        VStack {
            VStack {
                Image(systemName: "camera")
                    .resizable()
                    .foregroundStyle(Color.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding()

                createAccountForm
                createAccountButton
            }
            .scaledToFit()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("hlIndigo"))
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Create Account")
                    .foregroundStyle(Color.white)
                    .font(.title.weight(.semibold))
            }
        }
    }

    private var createAccountForm: some View {
        Form {
            Section {
                TextField("Email", text: $viewModel.email)
                TextField("Username", text: $viewModel.username)
                TextField("Password", text: $viewModel.password)
            }
        }
        .background(Color("hlIndigo"))
        .scrollContentBackground(.hidden)
        .padding()
    }

    private var createAccountButton: some View {
        AsyncActionButton("Create Account") {}
            .buttonStyle(.authentication)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
