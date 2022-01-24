//
//  PasswordValidator.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/19.
//

import Foundation

class PasswordChecker {
    private static let passwordMinCount = 8
    private static let passwordMaxCount = 16
    
    private static let uppercasePattern = "[A-Z]"
    private static let numberPattern = "[0-9]"
    private static let specialSymbolPattern = "[!@#$%]"
    
    static func checkSize(password: String?) -> Bool {
        guard let password = password
        else {
            return false
        }
        return password.count >= passwordMinCount
            && password.count <= passwordMaxCount
    }
    
    static func checkHasUpper(password: String?) -> Bool {
        guard let _ = password?.range(of: uppercasePattern, options: .regularExpression)
        else {
            return false
        }
        return true
    }
    
    static func checkHasNumber(password: String?) -> Bool {
        guard let _ = password?.range(of: numberPattern, options: .regularExpression)
        else {
            return false
        }
        return true
    }
    
    static func checkHasSpecialSymbol(password: String?) -> Bool {
        guard let _ = password?.range(of: specialSymbolPattern, options: .regularExpression)
        else {
            return false
        }
        return true
    }
    
    static func check(password: String?) -> Bool {
        guard let password = password else {
            return false
        }
        return checkSize(password: password)
        && checkHasNumber(password: password)
        && checkHasNumber(password: password)
        && checkHasSpecialSymbol(password: password)
    }
}
