//
//  CategorySectionButton.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/15/23.
//

import SwiftUI

struct CategorySectionButton<Label: View>: View {
    var action: () -> Void
    @ViewBuilder var label: () -> Label

    var body: some View {
        Button {
            action()
        } label: {
            label()
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
                .padding(8)

        }
        .background(Color.black.opacity(0.3))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 2)
        }
        .padding(8)
    }
}

struct CategorySectionButton_Previews: PreviewProvider {
    static var previews: some View {
        CategorySectionButton(action: {}) {
            Text("HI")
        }
    }
}
