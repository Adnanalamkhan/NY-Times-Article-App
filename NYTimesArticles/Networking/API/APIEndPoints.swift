//
//  APIEndPoints.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 11/08/25.
//

import Foundation

/// `APIEndPoints` defines the various API endpoints used in the application.
///
enum APIEndPoints {
    case mostViewed(section: MostViewedSection, period: ArticlesPeriod)
    
    /// Computed property that constructs and returns the full URL for given endpoint.
    /// - Returns: A fully formed `URL` for the endpoint.
    var url: URL? {
        let baseURL = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed"
        let apiKey = "e3tp5kZQAS8ABdtN6NVSZlCu2roMMgpM"
        
        switch self {
        case .mostViewed(section: let section, period: let period):
            return URL(string: "\(baseURL)/\(section.rawValue)/\(period.rawValue).json?api-key=\(apiKey)")
        }
    }
    
    enum MostViewedSection: String {
        case all = "all-sections"
    }
    
    enum ArticlesPeriod: Int {
        case day = 1
        case week = 7
        case month = 30
    }
}
