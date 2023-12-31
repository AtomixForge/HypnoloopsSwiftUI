//
//  DataImportManager.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/3/23.
//

import Foundation

class DataImportManager: DataImportManageable, ObservableObject {

    func parseJSON() -> [CategorySection] {
        guard let fileURL = Bundle.main.url(forResource: "Affirmations", withExtension: "json") else {
            print("Error locating Affirmations.json file.")
            return []
        }

        do {
            let data = try Data(contentsOf: fileURL)
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                var sections: [CategorySection] = []
                for sectionData in json {
                    if let title = sectionData["title"] as? String, let categoriesData = sectionData["categories"] as? [[String: Any]] {
                        var categories: [Category] = []
                        for categoryData in categoriesData {
                            if let categoryTitle = categoryData["title"] as? String, let affirmationsData = categoryData["affirmations"] as? [[String: Any]] {
                                var affirmations: [Affirmation] = []
                                for affirmationData in affirmationsData {
                                    if let id = affirmationData["id"] as? String, let affirmation = affirmationData["affirmation"] as? String {
                                        let liked = false
                                        let affirmationObj = Affirmation(id: id, affirmation: affirmation, liked: liked)
                                        affirmations.append(affirmationObj)
                                    }
                                }
                                let category = Category(title: categoryTitle, affirmations: affirmations)
                                categories.append(category)
                            }
                        }
                        let section = CategorySection(title: title, categories: categories)
                        sections.append(section)
                    }
                }
                return sections
            } else {
                print("Error parsing JSON.")
                return []
            }
        } catch {
            print("Error reading or parsing JSON: \(error)")
            return []
        }
    }

}
