//
//  NetworkService.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 11/08/25.
//

import Foundation

// MARK: - Network Service Protocol
protocol NetworkServiceProtocol {
    func fetchMostViewedArticles(section: APIEndPoints.MostViewedSection,
                                 period: APIEndPoints.ArticlesPeriod) async throws -> [ArticleModel]
}

// MARK: - Network Service APIs
/// An implementation of `NetworkServiceProtocol` that performs actual in app API calls.
final class NetworkService: NetworkServiceProtocol {
    func fetchMostViewedArticles(section: APIEndPoints.MostViewedSection,
                                 period: APIEndPoints.ArticlesPeriod) async throws -> [ArticleModel] {
        let result: Articles = try await fetch(.mostViewed(section: section, period: period), decodingModel: Articles.self)
        return result.results
    }
}

// MARK: - Network Service Manager
/// Generic method to fetch and decode data from a given API endpoint.
///
/// - Parameter endPoints: The `APIEndPoints` case representing the desired API call.
/// - Parameter decodingModel: The `Codable model` we want to decode from response.
/// - Returns: A decoded object of generic type `T` conforming to `Codable`.
/// - Throws: `Error`.
extension NetworkService {
    func fetch<T: Codable>(_ endPoints: APIEndPoints, decodingModel: T.Type) async throws -> T {
        guard let url = endPoints.url else { throw APIError.invalidURL }
        do {
            await Indicator.shared.showProgressView()
            debugPrint("Start api request for url::\n\(url)")
            let (data, response) = try await URLSession.shared.data(from: url)
            await Indicator.shared.hideProgressView()
            if let jsonString = String(data: data, encoding: .utf8) {
                debugPrint("Response::\n\(jsonString)\n")
            }
            debugPrint("End api request::\n\(url)")
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.invalidResponse }
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch let DecodingError.typeMismatch(type, context){
                debugPrint("Failed to decode response:\n Type \(type) mismatch:", context.debugDescription)
                debugPrint("codingPath:", context.codingPath)
                throw APIError.decodingError
            }
        } catch {
            throw APIError.networkError(error)
        }
    }
}
