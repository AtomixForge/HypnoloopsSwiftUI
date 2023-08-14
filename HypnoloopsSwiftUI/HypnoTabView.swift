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
            NavigationView {
                PlayView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }

            NavigationView {
                RecordView()
            }
            .tabItem {
                Image(systemName: "mic")
                Text("Record")
            }

            NavigationView {
                Text("Affirmations")
            }
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Affirmations")
            }

            NavigationView {
                Text("Likes")
            }
            .tabItem {
                Image(systemName: "heart")
                Text("Likes")
            }

            NavigationView {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person")
                Text("Me")
            }
        }
    }
}

struct HypnoTabView_Previews: PreviewProvider {
    static var previews: some View {
        HypnoTabView()
    }
}
