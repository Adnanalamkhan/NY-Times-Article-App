//
//  ArticlesViewController.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 11/08/25.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    // MARK: - IBOutlets & Properties
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: ArticlesViewModelProtocol?
    private var articlesList: [ArticleModel] = []
        
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getArticles()
    }
}

// MARK: - Configure TableView
extension ArticlesViewController {
    func configureTableView() {
        let nib = UINib(nibName: ArticleCell.reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ArticleCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - TableView Fucntions
extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseIdentifier, for: indexPath) as! ArticleCell
        cell.configureCell(with: articlesList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.pushToArticleDetails(with: articlesList[indexPath.row])
    }
}

// MARK: - Get Articles
extension ArticlesViewController {
    
    @MainActor
    func getArticles() {
        Task {
            do {
                articlesList = try await viewModel?.fetchArticles() ?? []
                tableView.reloadData()
            } catch {
                alert(message: error.localizedDescription)
            }
        }
    }
}
