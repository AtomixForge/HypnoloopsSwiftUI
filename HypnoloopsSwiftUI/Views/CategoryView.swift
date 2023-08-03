//
//  CategoryView.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/3/23.
//

import SwiftUI

struct CategoryView: View {
    @State private var sections: [Section] = []

    init() {
        Task {
            do {
                sections = try await FileImportManager.shared.loadJSON()
            } catch {
                throw error
            }
        }
    }

    var body: some View {
        VStack {
            HStack {
                Text("Category stuff")
                    .navigationTitle("Categories")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("hlIndigo"))
        .navigationTitle("Category View")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

/*
  [
     {
         "section": "Finance",
         "categories": [
             {
                 "title": "Abundance",
                 "affirmations": [
                     {
                         "id": "abundance_3",
                         "affirmation": "Abundance is my birthright"
                     },
                     ...
                 ]
             },
             ...
         ]
     },
     ...
 ]
  */
