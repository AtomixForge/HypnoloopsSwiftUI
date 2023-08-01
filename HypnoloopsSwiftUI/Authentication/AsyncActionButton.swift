//
//  AsyncActionButton.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 7/31/23.
//

import SwiftUI

struct AsyncActionButton<Label: View>: View {
    var action: () async -> Void
    @ViewBuilder var label: () -> Label

    @State private var isPerformingTask = false

    var body: some View {
        Button(action: performAction, label: {
            ZStack {
                label().opacity(isPerformingTask ? 0 : 1)

                if isPerformingTask {
                    ProgressView()
                        .frame(maxWidth: 16, maxHeight: 16)
                        .scaleEffect(0.5)
                }
            }
        })
        .disabled(isPerformingTask)
    }

    private func performAction() {
        isPerformingTask = true
        Task {
            await action()
            isPerformingTask = false
        }
    }
}

extension AsyncActionButton where Label == Text {
    init(_ title: LocalizedStringKey, action: @escaping () async -> Void) {
        self.init(action: action) {
            Text(title)
        }
    }

    init(_ title: String, action: @escaping () async -> Void) {
        self.init(action: action) {
            Text(title)
        }
    }
}

#Preview {
    AsyncActionButton("Test") {}
        .buttonStyle(.authentication)
}
