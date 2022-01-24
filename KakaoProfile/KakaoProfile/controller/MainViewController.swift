//
//  MainViewController.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/18.
//

import UIKit
import WebKit

class MainViewController: UIViewController, WKUIDelegate {
    
    private let url = "https://page.kakao.com"

    var webView: WKWebView!
    
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string:url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
