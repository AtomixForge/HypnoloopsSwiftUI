//
//  CategoryView.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/3/23.
//

import SwiftUI

struct CategoryView: View {
    @ObservedObject private var viewModel: CategoryViewModel

    init(viewModel: CategoryViewModel) {
        self.viewModel = viewModel
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.sections, id: \.id) { section in
                    CategorySectionRow(section: section)
                }
            }
            .onAppear {
                viewModel.loadData()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.hLoopIndigo)
        .navigationTitle("Categories")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(viewModel: .init())
    }
}
