//
//  NewsContentConfiguration.swift
//  PastelTest
//
//  Created by Chioma Amanda Mmegwa  on 23/08/2022.
//

import UIKit

struct NewsContentConfiguration: UIContentConfiguration, Hashable {
    var author: String?
    var title: String?
    var urlImage: String?
    var navigationController: UINavigationController?
    
    func makeContentView() -> UIView & UIContentView {
        return NewsContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> NewsContentConfiguration {
        self
    }
}
