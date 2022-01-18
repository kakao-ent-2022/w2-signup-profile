//
//  EditViewDelegate.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/18.
//

import Foundation
import UIKit

protocol EditProfileDelegate {
    func sendProfile(profileImage: UIImage, name: String, description: String)
}
