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
        VStack(alignment: .leading) {
            Text(section.title)
                .font(.title)
                .foregroundStyle(Color.white)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(section.categories, id: \.id) { category in
                        CategoryItem(category: category)
                    }
                }
            }
        }
    }
}

struct CategoryItem: View {
    var category: Category

    var body: some View {
        NavigationLink(destination: AffirmationsView(affirmations: category.affirmations)) {
            VStack(alignment: .leading) {
                Text(category.title)
                    .foregroundStyle(Color.white)
            }
            .frame(width: 150, height: 150)
            .background(Color.black)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.hlBlue, lineWidth: 5)
            )
            .padding(.leading, 8)
            .padding(.bottom, 8)
        }
    }
}

struct CategorySectionRow_Previews: PreviewProvider {
    static var previews: some View {
        let dataImportManager = DataImportManager()
        let viewModel = CategoryViewModel(dataImportManager: dataImportManager)
        viewModel.loadData()

        if let section = viewModel.sections.first {
            return CategorySectionRow(section: section)
        } else {
            return CategorySectionRow(section: CategorySection(title: "Test", categories: []))
        }
    }
}
