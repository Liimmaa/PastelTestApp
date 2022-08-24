//
//  NewsHeadlineViewController.swift
//  PastelTest
//
//  Created by Chioma Amanda Mmegwa  on 22/08/2022.
//

import Foundation
import UIKit
import WebKit

class NewsHeadlineViewController: UIViewController, WKUIDelegate {
    var viewModel = NewsViewModel()
        
    override func viewDidLoad() {
        title = "NewsFeed"
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        
        viewModel.getHeadlines(completion: {
            result in
            self.populate(with: result)
        })
    }
    
    func populate(with articles: [Article]) {
        var snaphot = datasource.snapshot()
        snaphot.appendSections([0])
        snaphot.appendItems(articles)
        datasource.apply(snaphot)
    }
    
    private lazy var collectionView: UICollectionView = {
        var listconfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: listconfiguration)
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemGroupedBackground
        
        return collectionView
    }()
    
    lazy var datasource: UICollectionViewDiffableDataSource<Int, Article> = {
        let articleCellConfig = UICollectionView.CellRegistration<NewsListCell, Article> { cell, indexPath, article in
            cell.article = article
        }
        
        let datasource = UICollectionViewDiffableDataSource<Int, Article>(collectionView: collectionView) { collectionView, indexPath, article in
            let configType = articleCellConfig
            
            return collectionView.dequeueConfiguredReusableCell(using: configType,
                                                                for: indexPath,
                                                                item: article)
        }
        
        return datasource
    }()
}

extension NewsHeadlineViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        guard let selectedItem = datasource.itemIdentifier(for: indexPath) else {
            collectionView.deselectItem(at: indexPath, animated: true)
            return
        }
        
        let vc = WebViewTest(url: selectedItem.url)
        navigationController?.pushViewController(vc, animated: true)
    }
}
