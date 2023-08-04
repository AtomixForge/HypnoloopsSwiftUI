//
//  CategoryViewModel.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/3/23.
//

import Foundation

final class CategoryViewModel: ObservableObject {
    @Published var sections: [CategorySection] = []
    private let dataImportManager: DataImportManager

    init(dataImportManager: DataImportManager = DataImportManager()) {
        self.dataImportManager = dataImportManager
    }

    func loadData() {
        sections = dataImportManager.parseJSON()
    }
}

