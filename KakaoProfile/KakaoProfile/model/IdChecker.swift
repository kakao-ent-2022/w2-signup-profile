//
//  IdChecker.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/19.
//

import Foundation

class IdChecker {
    private static let idMinCount = 5
    private static let idMaxCount = 20
    private static let idPattern = "^[0-9a-zA-Z_-]*$"
    
    static func checkId(id: String?) -> Bool {
        guard let id = id
        else {
            return false
        }
        
        return checkSize(id: id) && checkFormat(id: id)
    }
    
    private static func checkSize(id: String) -> Bool {
        return id.count >= idMinCount && id.count <= idMaxCount
    }
    
    private static func checkFormat(id: String) -> Bool {
        guard let _ = id.range(of: idPattern, options: .regularExpression) else {
            return false
        }
        return true
    }
}
