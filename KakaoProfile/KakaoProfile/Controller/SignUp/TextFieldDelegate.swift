//
//  TextFieldDelegate.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/20.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    weak var textView: CustomTextView?
    var validate: ((String) -> (Bool, String))?
    
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
        guard let unwrappedValidate = validate else { return }
        let (isValid, message) = unwrappedValidate(text)
        let messageColor = isValid ? UIColor.blue : UIColor.red
        textView?.updateCaption(caption: message, color: messageColor)
        textField.layer.borderColor =  isValid ? UIColor.gray.cgColor : UIColor.red.cgColor
    }
}
