//
//  SignUpTextField.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/20.
//

import Foundation
import UIKit

enum SignUpTextFieldStatus {
    case normal
    case focus
    case caution
}

protocol ValidationDelegate {
    func validate(value: String?) -> ValidationResult
}

protocol ValidatableTextField {
    func setCautionText(value: String)
}


class IdValidationDelegate: ValidationDelegate {
    func validate(value: String?) -> ValidationResult {
        let isValid = IdChecker.checkId(id: value)
        if isValid {
            return IdValidationResult.usableness
        }
        return IdValidationResult.invalidFormat
    }
}



class ValidationTextField: UITextField {
    private let borderWidth = 1
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.borderWidth = CGFloat(borderWidth)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = CGFloat(borderWidth)
    }

    func setStatus(status: SignUpTextFieldStatus) {
        switch status {
        case .normal:
            layer.borderColor = UIColor.black.cgColor
        case .caution:
            layer.borderColor = UIColor.red.cgColor
        case .focus:
            layer.borderColor = UIColor.yellow.cgColor
        }
    }
}


class CautionLable: UILabel {
    func setContent(content: ValidationResult){
        self.text = content.value
    }
}

class IdCautionLabel: CautionLable {
    override func setContent(content: ValidationResult) {
        super.setContent(content: content)
        guard let content = content as? IdValidationResult else {
            return
        }
        
        switch content {
      case .invalidFormat,
              .duplication:
          self.textColor = UIColor.red
      case .usableness:
          self.textColor = UIColor.green
      }
    }
//    func setContent(content: IdCautionContent) {
//        super.setContent(content: content)
//
//        switch content {
//        case .invalidFormat,
//                .duplication:
//            self.textColor = UIColor.red
//        case .usableness:
//            self.textColor = UIColor.green
//        }
//    }
}

class PasswordCautionLabel: CautionLable {
    
    func setContent(content: PasswordCautionContent) {
        super.setContent(content: content)
        
        switch content {
        case .usableness:
            self.textColor = UIColor.green
            
        case .invalidSize,
                .uppercaseNonExist,
                .numberNonExist,
                .specialSymbolNonExist:
            self.textColor = UIColor.red
        }
    }
}

class RePasswordCautionLabel: UILabel {
    
    func setContent(content: RePasswordCautionContent) {
//        super.setContent(content: content)
        
        switch content {
        case .match:
            self.textColor = UIColor.green
        case .nonMatch:
            self.textColor = UIColor.red
        }
    }
}

class NameCautionLabel: UILabel {
    
    func setContent(content: NameCautionContent) {
        
        switch content {
        case .nonExist:
            self.textColor = UIColor.red

        }
    }
}

class SignUpTextFieldDelegate: NSObject, UITextFieldDelegate {
    var validate: (String?) -> Bool
    
    init(validate: @escaping (String?) -> Bool) {
        self.validate = validate
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let signUpTextField = textField as? ValidationTextField
        else { return }
        signUpTextField.setStatus(status: .focus)
    }
    
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let signUpTextField = textField as? ValidationTextField
        else { return }
        if(validate(textField.text)) {
            signUpTextField.setStatus(status: .normal)
            return
        }
        signUpTextField.setStatus(status: .caution)
    }
}





