//
//  ArticlesModel.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 11/08/25.
//

import Foundation

struct Articles: Codable {
    var results: [ArticleModel]
}

struct ArticleModel: Codable {
    let title: String
    var abstract: String
    let published_date: String
    let byline: String
    private let media: [ArticleMedia]
    
    init(title: String,
         abstract: String,
         published_date: String,
         byline: String,
         media: [ArticleMedia]) {
        self.title = title
        self.abstract = abstract
        self.published_date = published_date
        self.byline = byline
        self.media = media
    }
    
    func getArticleImage(with quality: ArticleImageQuality = .thumbnail) -> String {
        media.first(where: { $0.type == AppConstants.image })?.mediaMetaData.first(where: { $0.format == quality.rawValue})?.url ?? ""
    }
}

struct ArticleMedia: Codable {
    let type: String
    let mediaMetaData: [ArticleMediaMetaData]
    
    enum CodingKeys: String, CodingKey {
        case type
        case mediaMetaData = "media-metadata"
    }
}

struct ArticleMediaMetaData: Codable {
    var url: String
    var format: String
}

enum ArticleImageQuality: String {
    case thumbnail = "Standard Thumbnail"
    case medium = "mediumThreeByTwo210"
}
