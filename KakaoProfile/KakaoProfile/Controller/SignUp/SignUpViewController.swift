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
    
    var iDTextFieldDelegate = TextFieldDelegate()
    var passwordTextFieldDelegate = TextFieldDelegate()
    var passwordCheckTextFieldDelegate = TextFieldDelegate()
    var nameTextFieldDelegate = TextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextView()
        initializeAllTextFieldDelegates()
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
    
    private func initializeAllTextFieldDelegates() {
        self.iDTextFieldDelegate.textView = idTextView
        self.passwordTextFieldDelegate.textView = passwordTextView
        self.passwordCheckTextFieldDelegate.textView = passwordCheckTextView
        self.nameTextFieldDelegate.textView = nameTextView
        
        self.iDTextFieldDelegate.validate = { (text: String) -> (Bool, String) in
                let pattern = "^[a-z0-9\\-\\_]{5,20}$"
                if let _ = text.range(of: pattern, options: .regularExpression) {
                    return (true, "사용 가능한 아이디입니다.")
                } else {
                    return (false, "사용 불가능한 아이디입니다.")
                }
        }
        
        self.passwordTextFieldDelegate.validate = { (text: String) -> (Bool, String) in
            guard text.count >= 8 && text.count <= 16 else {
                return (false, "8자 이상 16자 이하로 입력해주세요")
            }
            let pattern1 = "[A-Z]"
            let pattern2 = "[0-9]"
            let pattern3 = "[\\!\\@\\#\\$\\%]"
            guard let _ = text.range(of: pattern1, options: .regularExpression) else {
                return (false, "영문 대문자를 최소 1자 이상 포함해주세요")
            }
            guard let _ = text.range(of: pattern2, options: .regularExpression) else {
                return (false, "숫자를 최소 1자 이상 포함해주세요")
            }
            guard let _ = text.range(of: pattern3, options: .regularExpression) else {
                return (false, "특수문자를 최소 1자 이상 포함해주세요")
            }
            return (true, "안전한 비밀번호 입니다.")
        }

        self.passwordCheckTextFieldDelegate.validate = { (text: String) -> (Bool, String) in
            let targetText = self.passwordTextView.textField.text
            return text == targetText ? (true, "비밀번호가 일치합니다.") : (false, "비밀번호가 일치하지 않습니다.")
        }

        self.nameTextFieldDelegate.validate = { (text: String) -> (Bool, String) in
            return text.isEmpty ? (false, "이름은 필수 입력항목입니다.") : (true, "")
        }
    }
    
    private func setTextFieldDelegate() {
        idTextView.textField.delegate = self.iDTextFieldDelegate
        passwordTextView.textField.delegate = self.passwordTextFieldDelegate
        passwordCheckTextView.textField.delegate = self.passwordCheckTextFieldDelegate
        nameTextView.textField.delegate = self.nameTextFieldDelegate
    }
}
