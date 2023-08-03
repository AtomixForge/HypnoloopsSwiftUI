//
//  FileImportManager.swift
//  HypnoloopsSwiftUI
//
//  Created by Kenson Johnson on 8/3/23.
//

import Foundation

class FileImportManager {
    private init() {}
    static let shared = FileImportManager()

    func loadJSON() async throws -> [Section] {
        guard let url = Bundle.main.url(forResource: "Affirmations", withExtension: "json") else {
            throw NSError(domain: "com.hypnoloops", code: 419)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let sections = try decoder.decode([Section].self, from: data)
            return sections
        } catch {
            throw error
        }
    }
}
