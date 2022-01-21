//
//  ProfileDataDelegate.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/17.
//

import UIKit

protocol ProfileDataDelegate {
    func updateProfile(name: String?, description: String?, image: UIImage?)
}
