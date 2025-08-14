//
//  MockAppRouter.swift
//  NYTimesArticlesTests
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import Foundation
@testable import NYTimesArticles
import UIKit

final class MockAppRouter: AppRouterProtocol {
    var navigationController: UINavigationController
    var isConfigureRootViewControllerCalled = false
    var isPushToArticleDetailsCalled = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func configureRootViewController() {
        isConfigureRootViewControllerCalled = true
    }
    
    func pushToArticleDetails(with article: NYTimesArticles.ArticleModel) {
        isPushToArticleDetailsCalled = true
    }
    
}
