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
        NavigationView {
            ZStack {
                Color("hlIndigo")
                    .ignoresSafeArea()

                VStack {
                    Image(systemName: "camera")
                        .resizable()
                        .foregroundStyle(Color.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .padding(.top, 32)

                    Spacer()

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

                    AsyncActionButton("Create Account") {}
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
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
