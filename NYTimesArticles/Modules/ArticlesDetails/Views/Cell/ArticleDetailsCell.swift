//
//  ArticleDetailsCell.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import UIKit

final class ArticleDetailsCell: UITableViewCell, SetableCellProtocol {
    
    // MARK: - IBOutlets & Properties
    @IBOutlet private weak var articleImage: UIImageView!
    @IBOutlet private weak var articleName: UILabel!
    @IBOutlet private weak var articleDetails: UILabel!
    @IBOutlet private weak var articleAuthor: UILabel!
    static var reuseIdentifier : String{ return String(describing: self)}
    typealias DataType = ArticleModel
    
    override func awakeFromNib() {
        articleImage.addCornerRadius(15)
    }
    
    // MARK: - Cell Configuration
    func configureCell(with model: ArticleModel) {
        articleName.text = model.title
        articleDetails.text = model.abstract
        articleAuthor.text = model.byline
        Task {
            await articleImage.setImage(from: model.getArticleImage(with: .medium),
                                        placeholder: UIImage.userPlaceholderImage)
        }
    }
}
