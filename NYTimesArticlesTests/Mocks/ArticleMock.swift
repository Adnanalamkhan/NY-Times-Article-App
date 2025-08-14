//
//  ArticleMock.swift
//  NYTimesArticlesTests
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import Foundation
@testable import NYTimesArticles

/// This is hardcoded `Article Model` to use in testing for initialsing ViewModel or testing.
/// All the hardcoded value is taken from API response.
/// -
extension ArticleModel {
    static var mockArticles: ArticleModel {
        return ArticleModel(title: "A Look Inside Jeffrey Epstein’s Manhattan Lair",
                            abstract: "In his seven-story townhouse, the sex offender hosted the elite, displayed photos with presidents and showcased a first edition of “Lolita,” according to previously unreported photos and letters.",
                            published_date: "2025-08-05",
                            byline: "By David Enrich, Matthew Goldstein, Jessica Silver-Greenberg and Steve Eder",
                            media: [mockMedia])
    }
    
    static var mockMedia: ArticleMedia {
        return ArticleMedia(type: "image", mediaMetaData: mockMediaMetaData)
    }
    
    static var mockMediaMetaData: [ArticleMediaMetaData] {
        return [ArticleMediaMetaData(url: "https://static01.nyt.com/images/2025/08/05/multimedia/05inv-epstein-house-promo/05inv-epstein-house-promo-thumbStandard.jpg",
                                     format: "Standard Thumbnail"),
                ArticleMediaMetaData(url: "https://static01.nyt.com/images/2025/08/05/multimedia/05inv-epstein-house-promo/05inv-epstein-house-promo-mediumThreeByTwo210.jpg",
                                     format: "mediumThreeByTwo210"),
        ]
    }
}
