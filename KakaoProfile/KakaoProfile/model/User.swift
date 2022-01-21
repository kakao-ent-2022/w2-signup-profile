//
//  User.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/20.
//

import Foundation

struct User: Encodable {
    var id: String
    var password: String
    
    init?(id: String, password: String) {
        if(!IdChecker.checkId(id: id)) { return nil }
        if(!PasswordChecker.check(password: password)) { return nil }
        
        self.id = id
        self.password = password
    }
}
