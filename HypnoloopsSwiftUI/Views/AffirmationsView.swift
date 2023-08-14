//
//  AffirmationsView.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/11/23.
//

import SwiftUI

struct AffirmationsView: View {
    var affirmations: [Affirmation]

    var body: some View {
        List {
            ForEach(affirmations, id: \.self) { affirmation in
                Text(affirmation.affirmation)
                    .foregroundStyle(.white)
                    .listRowBackground(Color.hLoopIndigo)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.hLoopIndigo)
        .scrollContentBackground(.hidden)
    }
}

struct AffirmationsView_Previews: PreviewProvider {
    static var previews: some View {
        let dataImportManager = DataImportManager()
        let viewModel = CategoryViewModel(dataImportManager: dataImportManager)
        viewModel.loadData()

        if let affirmations = viewModel.sections.first?.categories.first?.affirmations {
            return AffirmationsView(affirmations: affirmations)
        } else {
            return AffirmationsView(affirmations: [])
        }
    }
}
