//
//  Receivable.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/19.
//

import Foundation
import UIKit

enum SignUpStatusCode: Int {
    case success = 200
    case paramsError = 400
    case duplicateError = 404
    
    private static let all = [success, paramsError, duplicateError]
    
    static func findBy(statusCode: Int) -> SignUpStatusCode? {
        return SignUpStatusCode.all
            .filter {$0.rawValue == statusCode}
            .first
    }
}
