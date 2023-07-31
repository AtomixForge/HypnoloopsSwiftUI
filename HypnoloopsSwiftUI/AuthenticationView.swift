//
//  ContentView.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 7/30/23.
//

import SwiftUI

struct AuthenticationView: View {
    @State var username = ""
    @State var password = ""
    var body: some View {

        VStack {
            VStack {
                Image("loopLogo3")
                    .resizable()
                    .frame(maxWidth: 300)
                    .aspectRatio(contentMode: .fit)

                authForm

                loginButton

                Button(action: createAccountTapped, label: {
                    Text("Create Account")
                        .foregroundStyle(Color.white)
                        .underline()
                })
                .buttonStyle(.plain)

            }
            .scaledToFit()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.hlIndigo)
    }

    private var authForm: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Password", text: $password)
            }
        }
        .background(Color.hlIndigo)
        .scrollContentBackground(.hidden)
    }

    private var loginButton: some View {
        Button(action: {
            print("hi")
        }, label: {
            Text("Login")
                .font(.title)
                .foregroundStyle(Color.white)
        })
        .frame(maxWidth: 250)
        .padding(12)
        .background(Color.hlPurple)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }

    private func createAccountTapped() {

    }
}

#Preview {
    AuthenticationView()
}
