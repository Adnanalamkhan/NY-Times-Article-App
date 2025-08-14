//
//  ArticleCell.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 11/08/25.
//

import UIKit

final class ArticleCell: UITableViewCell, SetableCellProtocol {
    
    // MARK: - IBOutlets & Properties
    @IBOutlet private weak var contentBackView: UIView!
    @IBOutlet private weak var articleImage: UIImageView!
    @IBOutlet private weak var articleName: UILabel!
    @IBOutlet private weak var authorName: UILabel!
    @IBOutlet private weak var publishedDate: UILabel!
    static var reuseIdentifier : String{ return String(describing: self)}
    typealias DataType = ArticleModel
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        articleImage.addCornerRadius(articleImage.frame.height/2)
        contentBackView.addCornerRadius(10)
    }
    
    // MARK: - Cell Configurations
    func configureCell(with model: ArticleModel) {
        articleName.text = model.title
        authorName.text = model.byline
        publishedDate.text = model.published_date
        Task {
            await articleImage.setImage(from: model.getArticleImage(),
                                        placeholder: UIImage.userPlaceholderImage)
        }
    }
    
}
