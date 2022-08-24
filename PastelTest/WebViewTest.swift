//
//  WebViewTest.swift
//  PastelTest
//
//  Created by Chioma Amanda Mmegwa  on 23/08/2022.
//

import Foundation
import UIKit
import WebKit

class WebViewTest: UIViewController, WKUIDelegate {
    var url: String
    var webView: WKWebView!
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        title = "NewsFeed"
        
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override func loadView() {
          let webConfiguration = WKWebViewConfiguration()
          webView = WKWebView(frame: .zero, configuration: webConfiguration)
          webView.uiDelegate = self
          view = webView
       }
}
