//
//  CategoryView.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/3/23.
//

import SwiftUI

struct CategoryView: View {
    @State private var sections: [CategorySection] = []

    var body: some View {
        VStack {
            List(sections, id: \.self) { section in
                Text(section.title)
            }
        }
        .onAppear {
            sections = FileImportManager.shared.parseJSON()
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
