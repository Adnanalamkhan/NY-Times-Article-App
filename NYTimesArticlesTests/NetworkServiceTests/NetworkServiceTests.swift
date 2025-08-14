//
//  NetworkServiceTests.swift
//  NYTimesArticlesTests
//
//  Created by Adnan Alam Khan on 13/08/25.
//

import XCTest
@testable import NYTimesArticles

final class NetworkServiceTests: XCTestCase {

    var networkService: NetworkServiceProtocol?
    let mockAPI = MockAPI()
    
    override func setUp() {
        networkService = mockAPI
    }
    
    func test_fetchArticles_success() async {
        mockAPI.responseCase = .success
        do {
            let articles = try await networkService?.fetchMostViewedArticles(section: .all,
                                                                             period: .week)
            XCTAssertNotNil(articles)
            XCTAssertEqual(articles?.count, 20)
        } catch {
            XCTFail("it shouldn't fail")
        }
    }
    
    func test_fetch_failure() async {
        mockAPI.responseCase = .badResponse
        do {
            _ = try await networkService?.fetchMostViewedArticles(section: .all, period: .week)
            XCTFail("it should fail")
        } catch {
            XCTAssertEqual(error.localizedDescription, "The data couldn’t be read because it is missing.")
        }
    }
    
    func test_fetchArticles_failureDecoding() async {
        mockAPI.responseCase = .decodingError
        do {
            _ = try await networkService?.fetchMostViewedArticles(section: .all, period: .week)
            XCTFail("it should fail")
        } catch {
            if let decodingError = error as? DecodingError {
                switch decodingError {
                case .typeMismatch(_, let context):
                    debugPrint("Decoding failed at \(context.codingPath): \(context.debugDescription)")
                    XCTAssertEqual(context.debugDescription, "Expected to decode String but found number instead.")
                default:
                    print("Unknown decoding error")
                }
            } else {
                XCTFail("Expected decoding error, but found some other error:\(error)")
            }
        }
    }
}
