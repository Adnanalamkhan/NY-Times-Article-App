//
//  ArticleDetailsViewModelTests.swift
//  NYTimesArticlesTests
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import XCTest
@testable import NYTimesArticles

final class ArticleDetailsViewModelTests: XCTestCase {

    var viewModel: ArticleViewDetailsProtocol?

    override func setUp() {
        viewModel = ArticleDetailsViewModel(article: .mockArticles)
    }

    func test_articleDetails() {
        XCTAssertNotNil(viewModel?.article)
    }
}
