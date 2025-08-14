//
//  MockAPI.swift
//  NYTimesArticlesTests
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import Foundation
@testable import NYTimesArticles

class MockAPI: NetworkServiceProtocol {
    
    /// - The `ResponseCase` property is used to trigger different testCases scenarios to test
    /// - By `Default` making it as success.
    var responseCase: MockResponseCases = .success
    
    func fetchMostViewedArticles(section: NYTimesArticles.APIEndPoints.MostViewedSection,
                                 period: NYTimesArticles.APIEndPoints.ArticlesPeriod) async throws -> [NYTimesArticles.ArticleModel] {
        if let jsonData = readLocalJSONFile(named: responseCase.jsonFileName) {
            let articles = try JSONDecoder().decode(Articles.self, from: jsonData)
            return articles.results
        }
        return []
    }
    
    private func readLocalJSONFile(named: String) -> Data? {
        if let path = Bundle.main.path(forResource: named, ofType: "json"),
           let jsonData = NSData(contentsOfFile: path) {
            return jsonData as Data
        }
        return nil
    }
}

