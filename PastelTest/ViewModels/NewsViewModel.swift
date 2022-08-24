//
//  NewsViewModel.swift
//  PastelTest
//
//  Created by Chioma Amanda Mmegwa  on 23/08/2022.
//

import Foundation

final class NewsViewModel {
    func getHeadlines(completion: @escaping ([Article]) -> ()) {
        NetWorkEngine.request(endpoint: NewsEndpoint.getHeadlines) { (result: Result<News, Error>) in
            switch result {
            case .success(let response):
                completion(response.articles)
            case .failure(let error):
                print(error)
            }
        }
    }
}
