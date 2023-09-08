//
//  SectionListView.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/15/23.
//

import SwiftUI

class SectionListViewModel: ObservableObject {
    let dataImportManager = DataImportManager()

    func sections() -> [CategorySection] {
        dataImportManager.parseJSON()
    }
}

struct SectionListView: View {
    var viewModel: SectionListViewModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(viewModel.sections(), id: \.id) { section in
                    CategorySectionCardView(section: section)
                }
            }
        }
    }
}

struct SectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionListView(viewModel: SectionListViewModel())
    }
}
