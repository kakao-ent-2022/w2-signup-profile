//
//  SignUpViewController.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/19.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var idTextView: CustomTextView!
    @IBOutlet weak var passwordTextView: CustomTextView!
    @IBOutlet weak var passwordCheckTextView: CustomTextView!
    @IBOutlet weak var nameTextView: CustomTextView!
    
    var iDTextFieldDelegate = IDTextFieldDelegate()
    var passwordTextFieldDelegate = PasswordTextFieldDelegate()
    var passwordCheckTextFieldDelegate = PasswordCheckTextFieldDelegate()
    var nameTextFieldDelegate = NameTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextView()
        passCustomViewToTextFieldDelegate()
        setTextFieldDelegate()
    }
    
    private func updateTextView() {
        idTextView.updateTitle(title: "아이디")
        idTextView.updatePlaceholder(placeHolder: "영문 소문자, 숫자, 특수기호(_,-), 5~20자")
        passwordTextView.updateTitle(title: "비밀번호")
        passwordTextView.updatePlaceholder(placeHolder: "영문 대/소문자, 숫자, 특수문자(!@#$%) 8~16자")
        passwordCheckTextView.updateTitle(title: "비밀번호 재확인")
        nameTextView.updateTitle(title: "이름")
        passwordTextView.textField.isSecureTextEntry = true
        passwordCheckTextView.textField.isSecureTextEntry = true
    }
    
    private func passCustomViewToTextFieldDelegate() {
        self.iDTextFieldDelegate.textView = idTextView
        self.passwordTextFieldDelegate.textView = passwordTextView
        self.passwordCheckTextFieldDelegate.textView = passwordCheckTextView
        self.passwordCheckTextFieldDelegate.targetTextView = passwordTextView
        self.nameTextFieldDelegate.textView = nameTextView
    }
    
    private func setTextFieldDelegate() {
        idTextView.textField.delegate = self.iDTextFieldDelegate
        passwordTextView.textField.delegate = self.passwordTextFieldDelegate
        passwordCheckTextView.textField.delegate = self.passwordCheckTextFieldDelegate
        nameTextView.textField.delegate = self.nameTextFieldDelegate
    }
}
