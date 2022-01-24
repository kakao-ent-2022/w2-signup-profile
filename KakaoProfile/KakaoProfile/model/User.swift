//
//  User.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/20.
//

import Foundation

struct User: Encodable {
    var name: String
    var id: String
    var password: String
    
    init?(name: String, id: String, password: String) {
        if(!IdChecker.checkId(id: id)) { return nil }
        if(!PasswordChecker.check(password: password)) { return nil }
        
        self.id = id
        self.password = password
        self.name = name 
    }
}
