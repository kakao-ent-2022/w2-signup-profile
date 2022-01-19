//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/19.
//

import UIKit

class LoginViewController: UIViewController {
    
    let onLoginSuccessSegue = "onLoginSuccess"
    let id = "kakao"
    let password = "1234"

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var idEditText: UITextField!
    @IBOutlet weak var passwordEditText: UITextField!
    
    @IBAction func selectLoginButtonTouched(_ sender: Any) {
        let idText = idEditText.text
        let passwordText = passwordEditText.text
        
        if(idText == id && passwordText == password) {
            self.performSegue(withIdentifier: onLoginSuccessSegue, sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        logoImageView.image = UIImage(named: "KakaoTalkLogo")
    }
}
