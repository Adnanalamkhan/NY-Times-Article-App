//
//  ArticleDetailsControllerTests.swift
//  NYTimesArticlesTests
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import XCTest
@testable import NYTimesArticles

final class ArticleDetailsControllerTests: XCTestCase {
    
    let articleDetailsVC = ArticleDetailsViewController()
    
    override func setUp() {
        articleDetailsVC.viewModel = ArticleDetailsViewModel(article: .mockArticles)
        articleDetailsVC.viewDidLoad()
        XCTAssertNotNil(articleDetailsVC.viewModel)
    }

    func test_setUpArticleDetails_WithValidData() {
        articleDetailsVC.setUpArticleDetails()
        XCTAssertEqual(articleDetailsVC.articleDetailsRows.count, 1)
    }

    func test_setUpArticleDetails_WithMissingData() {
        let articleDetailsVC = ArticleDetailsViewController()
        articleDetailsVC.viewModel = nil
        articleDetailsVC.setUpArticleDetails()
        XCTAssertEqual(articleDetailsVC.articleDetailsRows.count, 0)
    }
}
