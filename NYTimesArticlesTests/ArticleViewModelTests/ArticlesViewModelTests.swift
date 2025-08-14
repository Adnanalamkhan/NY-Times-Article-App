//
//  ArticlesViewModelTests.swift
//  NYTimesArticlesTests
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import XCTest
@testable import NYTimesArticles

final class ArticlesViewModelTests: XCTestCase {

    var viewModel: ArticlesViewModelProtocol?
    let mockAPI = MockAPI()
    let mockRouter = MockAppRouter(navigationController: UINavigationController())

    override func setUp() {
        viewModel = ArticlesViewModel(api: mockAPI, router: mockRouter)
    }
    
    func test_fetchArticles() async {
        mockAPI.responseCase = .success
        do {
            let articles = try await viewModel?.fetchArticles()
            XCTAssertNotNil(articles)
        } catch {
            XCTFail("it shouldn't fail")
        }
    }
    
    func test_emptyArticles() async {
        mockAPI.responseCase = .emptyData
        do {
            let article = try await viewModel?.fetchArticles()
            XCTAssertEqual(article?.count, 0)
        } catch {
            XCTFail("it should give empty array")
        }
    }
    
    func test_pushToArticleDetailsPage() {
        viewModel?.pushToArticleDetails(with: .mockArticles)
        XCTAssertTrue(mockRouter.isPushToArticleDetailsCalled)
    }
}
