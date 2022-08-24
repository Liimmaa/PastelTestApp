//
//  NewsEndpoint.swift
//  PastelTest
//
//  Created by Chioma Amanda Mmegwa  on 22/08/2022.
//

import Foundation

enum NewsEndpoint: Endpoint {
    case getHeadlines
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        case .getHeadlines:
            return "newsapi.org"
        }
    }
    
    var path: String {
        switch self {
        case .getHeadlines:
            return "/v2/top-headlines"
        }
    }
    
    var parameters: [URLQueryItem]? {
        let apiKey = "2d021085c2e64c23927ff485d9f4299b"
        let country = "us"
        
        switch self {
        case .getHeadlines:
            return [URLQueryItem(name: "country", value: country),
                    URLQueryItem(name: "apiKey", value: apiKey)]
            
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
}
