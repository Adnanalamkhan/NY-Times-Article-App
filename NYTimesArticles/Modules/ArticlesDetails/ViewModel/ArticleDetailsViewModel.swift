//
//  ArticleDetailsViewModel.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import Foundation

// MARK: - Article ViewModel Details Protocol
protocol ArticleViewDetailsProtocol {
    var article: ArticleModel { get set }
}

// MARK: - Article Details View Model
class ArticleDetailsViewModel: ArticleViewDetailsProtocol {
    var article: ArticleModel
    
    init(article: ArticleModel) {
        self.article = article
    }
}
