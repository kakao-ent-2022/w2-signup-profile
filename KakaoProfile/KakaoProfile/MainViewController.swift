//
//  MainViewController.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/19.
//

import UIKit
import WebKit

enum MainConstant {
    static let kakaoPageUrl = "https://page.kakao.com"
    static let navigationTitle = "카카오 페이지"
}

class MainViewController : UIViewController, WKUIDelegate {
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        return WKWebView(frame: .zero, configuration: webConfiguration)
    }()
    
    override func loadView() {
        initWebView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebViewUrl()
        initUI() 
    }
    
    private func initWebView() {
        webView.uiDelegate = self
        view = webView
    }
    
    private func loadWebViewUrl() {
        if let myURL = URL(string: MainConstant.kakaoPageUrl) {
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
        }
    }
    
    private func initUI() {
        navigationItem.title = MainConstant.navigationTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#file, #line, #function, #column)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#file, #line, #function, #column)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#file, #line, #function, #column)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#file, #line, #function, #column)
    }
}
