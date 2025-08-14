//
//  AppRouterTests.swift
//  NYTimesArticlesTests
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import XCTest
@testable import NYTimesArticles

final class AppRouterTests: XCTestCase {
    
    var appRouter: AppRouter?
    let navigationController = UINavigationController()
    
    override func setUp() {
        let api = MockAPI()
        appRouter = AppRouter(with: navigationController, api: api)
    }
    
    func test_configureRootViewController() {
        appRouter?.configureRootViewController()
        let rootVC = navigationController.viewControllers.first as! ArticlesViewController
        XCTAssertNotNil(rootVC.viewModel)
    }

    func test_pushToArticleDetails() {
        appRouter?.pushToArticleDetails(with: .mockArticles)
        let articleDetailsVC = navigationController.viewControllers.last as! ArticleDetailsViewController
        XCTAssertNotNil(articleDetailsVC.viewModel)
    }
}
