//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/18.
//

import UIKit

class LoginViewController: UIViewController, CAAnimationDelegate {
    private let correctId = "kakao"
    private let correctPassword = "kakao"

    @IBOutlet weak var idFiled: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTouched(_ sender: UIButton) {
        let inputId = idFiled.text
        let inputPassword = passwordField.text
        
        tryLogin(id: inputId, password: inputPassword)
    }
    
    private func tryLogin(id: String?, password: String?) {
        if !isLoginPossible(id: id, password: password) {
            return
        }

        navigateToMain()
    }
    
    private func isLoginPossible(id: String?, password: String?) -> Bool {
        return id == correctId && password == correctPassword
    }
    
    private func navigateToMain() {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "mainViewController") else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
