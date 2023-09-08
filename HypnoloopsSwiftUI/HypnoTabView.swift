//
//  HypnoTabView.swift
//  HypnoloopsSwiftUI
//
//  Created by Olijujuan Green on 8/13/23.
//

import SwiftUI

struct HypnoTabView: View {
    var body: some View {
            TabView {
                RecordView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }

                PlayView()
                    .tabItem {
                        Image(systemName: "mic")
                        Text("Record")
                    }

                SectionListView(viewModel: SectionListViewModel())
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                        Text("Affirmations")
                    }

                Text("Likes")
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Likes")
                    }

                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Me")
                    }
            }
    }
}


struct HypnoTabView_Previews: PreviewProvider {
    static let sectionListVM = SectionListViewModel()
    static var previews: some View {
       HypnoTabView()
    }
}
