//
//  SignUpViewController.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/19.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var idTextView: SignUpTextFieldView!
    @IBOutlet weak var passwordTextView: SignUpTextFieldView!
    @IBOutlet weak var passwordCheckTextView: SignUpTextFieldView!
    @IBOutlet weak var nameTextView: SignUpTextFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextView()
    }
    
    func updateTextView() {
        idTextView.updateTitle(title: "아이디")
        idTextView.updatePlaceholder(placeHolder: "영문 소문자, 숫자, 특수기호(_,-), 5~20자")
        passwordTextView.updateTitle(title: "비밀번호")
        passwordTextView.updatePlaceholder(placeHolder: "영문 대/소문자, 숫자, 특수문자(!@#$%) 8~16자")
        passwordCheckTextView.updateTitle(title: "비밀번호 재확인")
        nameTextView.updateTitle(title: "이름")
    }
}
