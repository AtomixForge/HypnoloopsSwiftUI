//
//  Affirmations.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/3/23.
//

import Foundation

struct Affirmation: Decodable {
    let title: String
    let affirmation: String
    var liked: Bool
}

struct Category: Decodable {
    let title: String
    let affirmations: [Affirmation]
}

struct Section: Decodable {
    let title: String
    let categories: [Category]
}
