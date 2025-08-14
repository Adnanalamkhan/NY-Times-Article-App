//
//  ArticlesViewModel.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 11/08/25.
//

import Foundation

// MARK: Articles ViewModel Protocol
protocol ArticlesViewModelProtocol {
    func pushToArticleDetails(with article: ArticleModel)
    func fetchArticles() async throws -> [ArticleModel]
}

// MARK: Articles ViewModel
final class ArticlesViewModel: ArticlesViewModelProtocol {
    
    private let api: NetworkServiceProtocol
    private let router: AppRouterProtocol
    
    init(api: NetworkServiceProtocol, router: AppRouterProtocol) {
        self.api = api
        self.router = router
    }
    
    func fetchArticles() async throws -> [ArticleModel] {
        return try await api.fetchMostViewedArticles(section: .all, period: .week)
    }

    func pushToArticleDetails(with article: ArticleModel) {
        router.pushToArticleDetails(with: article)
    }
}
