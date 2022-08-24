//
//  NewsListCell.swift
//  PastelTest
//
//  Created by Chioma Amanda Mmegwa  on 23/08/2022.
//

import UIKit

class NewsListCell: UICollectionViewListCell {
    var article: Article?

    override func updateConfiguration(using state: UICellConfigurationState) {
        var newConfiguration = NewsContentConfiguration().updated(for: state)
        
        newConfiguration.title = article?.title
        newConfiguration.author = article?.author
        newConfiguration.urlImage = article?.urlToImage
     
        contentConfiguration = newConfiguration
    }
}
