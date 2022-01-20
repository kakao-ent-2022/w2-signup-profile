//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/19.
//

import UIKit

enum LoginConstant {
    static let onLoginSuccessSegue = "onLoginSuccess"
    static let id = "kakao"
    static let password = "1234"
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var idEditText: UITextField!
    @IBOutlet weak var passwordEditText: UITextField!
    
    @IBAction func selectLoginButtonTouched(_ sender: Any) {
        let idText = idEditText.text
        let passwordText = passwordEditText.text
        
        if(idText == LoginConstant.id && passwordText == LoginConstant.password) {
            self.performSegue(withIdentifier: LoginConstant.onLoginSuccessSegue, sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        logoImageView.image = UIImage(named: "KakaoTalkLogo")
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
