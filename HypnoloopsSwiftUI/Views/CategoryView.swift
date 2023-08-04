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
    }

    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.sections, id: \.self) { section in
                    HStack {
                        Text(section.title)
                    }
                    .frame(height: 200)
                }
            }
            .onAppear {
                viewModel.loadData()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.hLoopIndigo)
        .navigationTitle("Category View")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(viewModel: .init())
    }
}
