//
//  APIError.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 11/08/25.
//

import Foundation

/// `APIError` defines the possible errors that can occur while performing API requests.
/// It conforms to `Error` and `LocalizedError` for easy error handling and user-friendly error messages.
enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid"
        case .invalidResponse:
            return "The server returned an invalid response."
        case .decodingError:
            return "Failed to decode response:"
        case .networkError(let error):
            return "Network request failed: \(error.localizedDescription)"
        }
    }
}
