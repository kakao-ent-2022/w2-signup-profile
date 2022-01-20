//
//  EditProfileDataProtocol.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/19.
//

import UIKit

protocol EditProfileDataProtocol: class {
    func sendProfileData(nameText: String?, descriptionText: String?, profileImage: UIImage?)
}
