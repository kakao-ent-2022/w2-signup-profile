//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/18.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return self.idTextField.text == "kakao" && self.passwordTextField.text == "kakao"
    }
}
