//
//  CategorySectionRow.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/4/23.
//

import SwiftUI

struct CategorySectionRow: View {
    var section: CategorySection

    var body: some View {
        VStack {
            Text(section.title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding()


            ForEach(section.categories, id: \.self) { category in
                Text(category.title)
                    .foregroundColor(.secondary)
                    .padding(.leading)
            }
        }
    }
}

struct CategorySectionRow_Previews: PreviewProvider {
    static var previews: some View {
        let dataImportManager = DataImportManager()
        let viewModel = CategoryViewModel(dataImportManager: dataImportManager)
        viewModel.loadData()

        return Group {
            if let section = viewModel.sections.first {
                CategorySectionRow(section: section)
            } else {
                CategorySectionRow(section: CategorySection(title: "Test", categories: []))
            }
        }
    }
}
