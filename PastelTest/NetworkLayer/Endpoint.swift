//
//  Endpoint.swift
//  PastelTest
//
//  Created by Chioma Amanda Mmegwa  on 22/08/2022.
//

import Foundation

protocol Endpoint {
    // HTTPS or HTTP
    var scheme: String { get }
    
    // Example: "www.google.com"
    var baseURL: String { get }
    
    // "/service/rest/"
    var path: String { get }
    
    // [URLQueryItem(name: "api_key", value: "API_KEY"]
    var parameters: [URLQueryItem]? { get }
    
    // "GET"
    var method: String { get }
}
