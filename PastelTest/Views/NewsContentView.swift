//
//  NewsContentView.swift
//  PastelTest
//
//  Created by Chioma Amanda Mmegwa  on 23/08/2022.
//

import UIKit

class NewsContentView: UIView, UIContentView {
    private var currentConfiguration: NewsContentConfiguration!
    
    func setupUrl(url: String) {
        backgroundImageView.loadImageFromUrl(urlString: url)
    }
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.7
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray5
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fill
        stackview.spacing = 5
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        stackview.addArrangedSubview(descriptionLabel)
        stackview.addArrangedSubview(authorName)
        return stackview
    }()
    
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        }
        set {
            guard let newConfiguration = newValue as? NewsContentConfiguration else {
                return
            }
            
            apply(configuration: newConfiguration)
        }
    }
    
    init(configuration: NewsContentConfiguration) {
        super.init(frame: .zero)
        
        setupAllViews()

        apply(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func apply(configuration: NewsContentConfiguration) {
        guard currentConfiguration != configuration else {
            return
        }
        
        // Replace current configuration with new configuration
        currentConfiguration = configuration
        
        // set data to ui elements
        setupUrl(url: configuration.urlImage ?? "")
        descriptionLabel.text = configuration.title
        authorName.text = configuration.author
    }
    
    private func setupAllViews() {
        addSubview(backgroundImageView)
        backgroundImageView.addSubview(shadowView)
        shadowView.addSubview(contentStackView)
        
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        shadowView.leftAnchor.constraint(equalTo: backgroundImageView.leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor).isActive = true
        shadowView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor).isActive = true
        
        contentStackView.leftAnchor.constraint(equalTo: shadowView.leftAnchor, constant: 10).isActive = true
        contentStackView.rightAnchor.constraint(equalTo: shadowView.rightAnchor, constant: -10).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -8).isActive = true
    }
}
