//
//  SignUpTextField.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/20.
//

import Foundation
import UIKit

protocol ValidationDelegate {
    func validate(value: String?) -> ValidationResult
}

class IdValidationDelegate: ValidationDelegate {
    func validate(value: String?) -> ValidationResult {
        let isValid = IdChecker.checkId(id: value)
        if isValid {
            return IdValidationResult.valid
        }
        return IdValidationResult.invalidFormat
    }
}

class PasswordValidationDelegate: ValidationDelegate {
    func validate(value: String?) -> ValidationResult {
        if (!PasswordChecker.checkSize(password: value)) {
            return PasswordValidationResult.invalidSize
        }
        
        if(!PasswordChecker.checkHasUpper(password: value)) {
            return PasswordValidationResult.uppercaseNonExist
        }
        
        if(!PasswordChecker.checkHasNumber(password: value)) {
            return PasswordValidationResult.numberNonExist
        }
        
        if(!PasswordChecker.checkHasSpecialSymbol(password: value)) {
            return PasswordValidationResult.specialSymbolNonExist
        }
        
        return PasswordValidationResult.valid
    }
}

protocol StandardValidationDelegate: ValidationDelegate, AnyObject {
    associatedtype T
    var standard: T? { get }
}

class RePasswordValidationDelegate: StandardValidationDelegate {
    internal var standard: String?
    
    func validate(value: String?) -> ValidationResult {
        if let standard = standard,
           let value = value,
           standard == value {
            return RePasswordValidationContent.match
        }
    
        return RePasswordValidationContent.nonMatch
    }
}

class NameValidationDelgate: ValidationDelegate {
    func validate(value: String?) -> ValidationResult {
        if value?.isEmpty ?? false {
            return NameValidationResult.nonExist
        }
        return NameValidationResult.exist
    }
}
