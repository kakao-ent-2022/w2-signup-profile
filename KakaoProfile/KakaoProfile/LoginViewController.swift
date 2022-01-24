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
    
    static let loginFailedAlertTitle = "로그인 실패"
    static let loginFailedAlertMessage = "아이디 또는 비밀번호가 맞지 않습니다."
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
        } else {
            showLoginFailedAlert()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        logoImageView.image = UIImage(named: "KakaoTalkLogo")
    }
    
    private func showLoginFailedAlert() {
        let alert = UIAlertController(title: LoginConstant.loginFailedAlertTitle, message: LoginConstant.loginFailedAlertMessage, preferredStyle: .alert)
        let defaultAction =  UIAlertAction(title: "확인", style: .default)
        alert.addAction(defaultAction)

        present(alert, animated: false)
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
