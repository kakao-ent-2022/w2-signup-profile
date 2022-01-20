//
//  MainViewController.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/18.
//

import UIKit
import WebKit

class MainViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        self.webView.uiDelegate = self
        view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let kakaopageURL = URL(string: "https://page.kakao.com")
        let myRequest = URLRequest(url: kakaopageURL!)
        self.webView.load(myRequest)
    }
}
