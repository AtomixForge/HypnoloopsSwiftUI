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
        Button(action: {
            Task {
                isPerformingTask = true
                await action()
                isPerformingTask = false
            }

        }, label: {
            ZStack {
                label().opacity(isPerformingTask ? 0 : 1)

                if isPerformingTask {
                    ProgressView()
                        .frame(maxWidth: 16, maxHeight: 16)
                        .scaleEffect(2.0)
                        .tint(.white)
                }
            }
        })
        .disabled(isPerformingTask)
    }

    private func performAction() {
        Task {
            isPerformingTask = true
            await action()
        }
        isPerformingTask = false
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

struct AsyncActionButton_Previews: PreviewProvider {
    static var previews: some View {
        AsyncActionButton("Test") {}
    }
}
