//
//  AppRouter.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import Foundation
import UIKit

protocol AppRouterProtocol {
    var navigationController: UINavigationController { get set }
    func configureRootViewController()
    func pushToArticleDetails(with article: ArticleModel)
}

/// The AppRouter class conforms to AppRouterProtocol and handles navigation.
///
/// Initializes an AppRouter with the given navigation controller and network service.
final class AppRouter: AppRouterProtocol {
    var navigationController: UINavigationController
    let api: NetworkServiceProtocol

    init(with navigationController: UINavigationController, api: NetworkServiceProtocol) {
        self.navigationController = navigationController
        self.api = api
    }
    
    func configureRootViewController() {
        let articleListVC = UIStoryboard.instantiateViewController(ArticlesViewController.self)
        articleListVC.viewModel = ArticlesViewModel(api: api, router: self)
        self.navigationController.pushViewController(articleListVC, animated: true)
    }
    
    func pushToArticleDetails(with article: ArticleModel) {
        let articleDetailsVC = UIStoryboard.instantiateViewController(ArticleDetailsViewController.self)
        articleDetailsVC.viewModel = ArticleDetailsViewModel(article: article)
        self.navigationController.pushViewController(articleDetailsVC, animated: true)
    }
}
