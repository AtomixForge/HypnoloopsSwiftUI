//
//  CategoryView.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/3/23.
//

import SwiftUI

struct CategoryView: View { 
    
    var body: some View {
        VStack {
            HStack{
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
