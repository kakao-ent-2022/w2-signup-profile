//
//  SignUpViewController.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/20.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }

    private func initUI() {
        idTextField.placeholder = "영문 소문자, 숫자, 특수기호(_,-), 5~20자"
        passwordTextField.placeholder = "영문 대/소문자, 숫자, 특수문자(!@#$%) 8~16자"
    }
}
