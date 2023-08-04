//
//  Affirmations.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/3/23.
//

import Foundation

struct Affirmation: Decodable, Hashable {
    let id: String
    let affirmation: String
    var liked: Bool
}

struct Category: Decodable, Hashable {
    let title: String
    let affirmations: [Affirmation]
}

struct CategorySection: Decodable, Hashable {
    let title: String
    let categories: [Category]
}
