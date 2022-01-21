//
//  TextFieldDelegate.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/20.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    weak var textView: CustomTextView?
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text == "" {
            textView?.updateCaption(caption: "")
            textField.layer.borderColor = UIColor.gray.cgColor
            return
        }
        let (isValid, message) = validate(text: text)
        let messageColor = isValid ? UIColor.blue : UIColor.red
        textView?.updateCaption(caption: message, color: messageColor)
        textField.layer.borderColor =  isValid ? UIColor.gray.cgColor : UIColor.red.cgColor
    }
    
    fileprivate func validate(text: String) -> (Bool, String) {
        return (true, "")
    }
}

class IDTextFieldDelegate: TextFieldDelegate {
    override fileprivate func validate(text: String) -> (Bool, String) {
        let pattern = "^[a-z0-9\\-\\_]{5,20}$"
        if let _ = text.range(of: pattern, options: .regularExpression) {
            return (true, "사용 가능한 아이디입니다.")
        } else {
            return (false, "사용 불가능한 아이디입니다.")
        }
    }
}

class PasswordTextFieldDelegate: TextFieldDelegate {
    override fileprivate func validate(text: String) -> (Bool, String) {
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
}

class PasswordCheckTextFieldDelegate: TextFieldDelegate {
    weak var targetTextView: CustomTextView?
    override fileprivate func validate(text: String) -> (Bool, String) {
        return text == targetTextView?.textField.text ? (true, "비밀번호가 일치합니다.") : (false, "비밀번호가 일치하지 않습니다.")
    }
}

class NameTextFieldDelegate: TextFieldDelegate {
    override fileprivate func validate(text: String) -> (Bool, String) {
        return text.isEmpty ? (false, "이름은 필수 입력항목입니다.") : (true, "")
    }
}
