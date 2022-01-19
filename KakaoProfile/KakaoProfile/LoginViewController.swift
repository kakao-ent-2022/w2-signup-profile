//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/19.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var idEditText: UITextField!
    @IBOutlet weak var passwordEditText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        logoImageView.image = UIImage(named: "KakaoTalkLogo")
    }
}
