//
//  Affirmations.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/3/23.
//

import Foundation

struct Affirmation  {
    let id: String
    let affirmation: String
    var liked: Bool
}

struct Category {
    let id = UUID()
    let title: String
    let affirmations: [Affirmation]
}

struct CategorySection: Identifiable {
    let id = UUID()
    let title: String
    let categories: [Category]
}
