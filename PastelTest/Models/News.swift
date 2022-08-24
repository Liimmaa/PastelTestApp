//
//  News.swift
//  PastelTest
//
//  Created by Chioma Amanda Mmegwa  on 22/08/2022.
//

import Foundation
import UIKit

struct News: Codable, Hashable {
    let articles: [Article]
    
    init(articles: [Article]) {
        self.articles = articles
    }
}

struct Article: Codable, Hashable {
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage
    }
}

struct Source: Codable, Hashable {
    let id: String?
    let name: String
}


extension UIImageView {
    func loadImageFromUrl(urlString: String) {
        self.image = nil
        
        guard let url = URL(string: urlString) else {
            return
        }
                
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let data = data, let downloadedImage = UIImage(data: data) {
                    self.image = downloadedImage
                }
            }
        }
        task.resume()
    }
}
