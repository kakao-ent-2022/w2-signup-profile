//
//  Storage.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/21.
//

import Foundation

class UserStorage {
    private static let userKey = "user"
    
    static func save(user: User) {
        let encodable = try? PropertyListEncoder().encode(user)
        
        UserDefaults.standard
            .set(encodable, forKey: userKey)
    }
    
    static func get(user: User) -> User? {
        return UserDefaults.standard
            .object(forKey: userKey) as? User
    }
}
