//
//  MockResponseCasesEnum.swift
//  NYTimesArticlesTests
//
//  Created by Adnan Alam Khan on 13/08/25.
//

import Foundation

/// - `MockResponseCases` use to test for different responses in testCases using Mock JSON file
/// - With this value we're providing desired Mock Json file in `MockAPI` class.
enum MockResponseCases {
    case success
    case emptyData
    case badResponse
    case decodingError
    
    var jsonFileName: String {
        switch self {
        case .success:
            return "ArticleList"
        case .emptyData:
            return "EmptyArticles"
        case .badResponse:
            return "FailureMock"
        case .decodingError:
            return "DecodingError"
        }
    }
}
