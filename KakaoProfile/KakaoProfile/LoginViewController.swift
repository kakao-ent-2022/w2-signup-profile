//
//  ViewController.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/17.
//

import UIKit

class LoginViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet var idTextEdit: UITextField!
    @IBOutlet var passwordTextEdit: UITextField!
    
    let realId = "1234"
    let realPassword = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    private func isValidLoginForm(id: String?, password: String?) -> Bool {
        return id == self.realId && password == self.realPassword
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showNews" {
            let inputId = idTextEdit.text
            let inputPassword = passwordTextEdit.text
            return isValidLoginForm(id: inputId, password: inputPassword)
        }
        
        return true
    }
    
    
    
}

