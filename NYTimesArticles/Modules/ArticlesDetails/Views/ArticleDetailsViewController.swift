//
//  ArticleDetailsViewController.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 12/08/25.
//

import UIKit

//MARK: - Article Row Enum
enum ArticleDetailsRow {
    case article(ArticleModel)
}

class ArticleDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets & Properties
    @IBOutlet private weak var tableView: UITableView?
    
    var viewModel: ArticleViewDetailsProtocol?
    private(set) var articleDetailsRows: [ArticleDetailsRow] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        configureTableView()
        setUpArticleDetails()
    }
}

// MARK: - UI Configuration
extension ArticleDetailsViewController {
    func configureTableView() {
        let nib = UINib(nibName: ArticleDetailsCell.reuseIdentifier, bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: ArticleDetailsCell.reuseIdentifier)
        tableView?.dataSource = self
    }
}

// MARK: - Set up Article Data
extension ArticleDetailsViewController {
    func setUpArticleDetails() {
        guard let articleDetails = viewModel?.article else {
            alert(message: AppConstants.articleDetailsNotAvailable)
            return
        }
        articleDetailsRows = [.article(articleDetails)]
        tableView?.reloadData()
        
    }
}

// MARK: - TableView Functions
extension ArticleDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleDetailsRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rows = articleDetailsRows[indexPath.row]
        switch rows {
        case .article(let articles):
            let cell = self.tableView?.dequeueReusableCell(withIdentifier: ArticleDetailsCell.reuseIdentifier, for: indexPath) as! ArticleDetailsCell
            cell.configureCell(with: articles)
            return cell
        }
    }
}
