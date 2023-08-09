//
//  HypnoAlertView.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/8/23.
//

import SwiftUI

enum HypnoAlert {
    case success
    case error(title: String, messages: [String])  // Change message to messages

    func title() -> String {
        switch self {
        case .error(let title, _):
            return title
        case .success:
            return "Success"
        }
    }

    var leftActionText: String {
        switch self {
        case .error(_, _):
            return "OK"
        case .success:
            return "Confirm"
        }
    }

    var rightActionText: String {
        switch self {
        case .error(_, _):
            return "Cancel"
        case .success:
            return "Cancel"
        }
    }

    func height(isShowingVerticalButtons: Bool = false) -> CGFloat {
        switch self {
        case .error(_, _):
            return isShowingVerticalButtons ? 220 : 150
        case .success:
            return isShowingVerticalButtons ? 220 : 150
        }
    }
}

struct HypnoAlertModifier: ViewModifier {
    @Binding var presentAlert: Bool
    var alertType: HypnoAlert
    var leftButtonAction: (() -> Void)?
    var rightButtonAction: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .overlay(
                ZStack {
                    Color.black.opacity(0.75)
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        Text(alertType.title())
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.vertical, 12)

                        if case .error(_, let messages) = alertType {
                            VStack(spacing: 0){
                                ForEach(messages, id: \.self) { message in
                                    Text(message)
                                        .font(.body)
                                        .foregroundColor(.red)
                                        .padding(.horizontal)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(maxHeight: CGFloat(messages.count * 12))
                            }
                        }

                        HStack {
                            Button(action: {
                                leftButtonAction?()
                                withAnimation {
                                    presentAlert = false
                                }
                            }) {
                                Text(alertType.leftActionText)
                            }
                            .padding()

                            if rightButtonAction != nil {
                                Button(action: {
                                    rightButtonAction?()
                                    withAnimation {
                                        presentAlert = false
                                    }
                                }) {
                                    Text(alertType.rightActionText)
                                        .foregroundColor(.red)
                                }
                                .padding()
                            }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .opacity(presentAlert ? 1 : 0)
            )
    }
}

extension View {
    func hypnoAlert(presentAlert: Binding<Bool>, alertType: HypnoAlert, leftButtonAction: (() -> Void)?, rightButtonAction: (() -> Void)?) -> some View {
        modifier(HypnoAlertModifier(
            presentAlert: presentAlert,
            alertType: alertType,
            leftButtonAction: leftButtonAction,
            rightButtonAction: rightButtonAction
        ))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    @State private var presentAlert = true

    var body: some View {
        AuthenticationView()
            .hypnoAlert(
                presentAlert: $presentAlert,
                alertType: .error(title: "Error Title", messages: ["Error Message 1", "Error Message 2"]),
                leftButtonAction: {},
                rightButtonAction: nil
            )

        AuthenticationView()
            .hypnoAlert(
                presentAlert: $presentAlert,
                alertType: .success,
                leftButtonAction: {},
                rightButtonAction: {}
            )
    }
}
