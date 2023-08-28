//
//  CategorySectionCardView.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/15/23.
//

import SwiftUI

struct CategorySectionCardView: View {
    var section: CategorySection

    var body: some View {
        ZStack {

            Image("finance")
                .resizable()
                .aspectRatio(contentMode: .fill)

            VStack {
                Spacer()

                CategorySectionButton(action: {}) {
                    Text(section.title)
                }

            }
        }
        .frame(width: 300, height: 200)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CategorySectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySectionCardView(section: CategorySection(title: "Section Title", categories: []))
    }
}
