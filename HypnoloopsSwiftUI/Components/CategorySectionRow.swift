//
//  CategorySection.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/4/23.
//

import SwiftUI

struct CategorySectionRow: View {
    var section: CategorySection

    var body: some View {
        Text(section.title)
    }
}

struct CategorySectionRow_Previews: PreviewProvider {
    static var previews: some View {
        var categoryViewModel = CategoryViewModel()

        if let section = categoryViewModel.sections.first {
            CategorySectionRow(section: section)
        } else {
            CategorySectionRow(section: CategorySection(title: "Test", categories: []))
        }
    }
}
