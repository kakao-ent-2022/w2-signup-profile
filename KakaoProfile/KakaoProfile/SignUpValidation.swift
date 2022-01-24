//
//  SignUpValidation.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/21.
//

import Foundation

enum SignUpValidationError: Error {
    case InvaildSignUpText(errorMessage: String)
}

class SignUpValidation {
    enum ValidationType {
        static let id = "^[0-9a-z_-]{5,20}$"
        static let password = "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%])[0-9a-zA-Z!@#$%]{8,16}$"
    }
    
    enum PasswordFailType {
        static let length = "^.{8,16}$"
        static let upperCase = "(?=.*?[A-Z])"
        static let number = "(?=.*?[0-9])"
        static let specialCharacter = "(?=.*?[!@#$%])"
    }

    func getValidationInformation(tag: Int, text: String, compareText: String?) throws -> String {
        if let itemType = SignUpItem(rawValue: tag) {
            switch(itemType) {
            case .id: return try validateId(id: text)
            case .password: return try validatePassword(password: text)
            case .passwordCheck: if let compareText = compareText { return try checkPassword(originPassword: compareText, checkPassword: text) }
            case .name: return try validateName(name: text)
            }
        }
        return ""
    }
    
    private func validateRegularExpression(text: String, pattern: String) -> Bool {
        let regex = try? NSRegularExpression(pattern: pattern)
        
        return regex?.firstMatch(in: text, options: [], range: NSRange(location: 0, length: text.count)) != nil
    }
    
    private func validateId(id: String) throws -> String {
        if validateRegularExpression(text: id, pattern: ValidationType.id) {
            return "사용 가능한 아이디입니다."
        } else {
            throw SignUpValidationError.InvaildSignUpText(errorMessage: "5~20자의 영문 소문자, 숫자와 특수기호_,- 만 사용 가능합니다.")
        }
    }
    
    private func validatePassword(password: String) throws -> String {
        if validateRegularExpression(text: password, pattern: ValidationType.password) {
            return "안전한 비밀번호입니다."
        } else {
            var errorMessage = "안전하지 않은 비밀번호입니다."
            if !validateRegularExpression(text: password, pattern: PasswordFailType.length) {
                errorMessage = "8자 이상 16자 이하로 입력해주세요."
            } else if !validateRegularExpression(text: password, pattern: PasswordFailType.upperCase) {
                errorMessage = "영문 대문자를 최소 1자 이상 포함해주세요."
            } else if !validateRegularExpression(text: password, pattern: PasswordFailType.number) {
                errorMessage = "숫자를 최소 1자 이상 포함해주세요."
            } else if !validateRegularExpression(text: password, pattern: PasswordFailType.specialCharacter) {
                errorMessage = "특수문자(!@#$%)를 최소 1자 이상 포함해주세요."
            }
            
            throw SignUpValidationError.InvaildSignUpText(errorMessage: errorMessage)
        }
    }
    
    private func checkPassword(originPassword: String, checkPassword: String) throws -> String {
        if originPassword == checkPassword {
            return "비밀번호가 일치합니다."
        } else {
            throw SignUpValidationError.InvaildSignUpText(errorMessage: "비밀번호가 일치하지 않습니다.")
        }
    }
    
    private func validateName(name: String) throws -> String {
        if !name.isEmpty {
            return "사용 가능한 이름입니다."
        } else {
            throw SignUpValidationError.InvaildSignUpText(errorMessage: "이름은 필수 입력 항목입니다.")
        }
    }
}
