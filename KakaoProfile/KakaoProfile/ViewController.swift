//
//  ViewController.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/17.
//

import UIKit

class ViewController: UIViewController, EditProfileDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initRoot()
        initNameLabel()
        initDescriptionLabel()
        initProfileImage()
    }
    
    func initRoot() {
        view.backgroundColor = UIColor.init(red: 133 / 255.0, green: 147 / 255.0, blue: 153 / 255.0, alpha: 1)
    }
    
    func initNameLabel() {
        nameLable.text = "JK"
        nameLable.textColor = UIColor.cyan
        nameLable.font = self.nameLable.font.withSize(25)
        nameLable.layer.shadowOpacity = 0.5
        nameLable.textAlignment = NSTextAlignment.center
    }
    
    func initDescriptionLabel() {
        descriptionLabel.text = "카르페 디엠"
        descriptionLabel.textColor = UIColor.brown
        descriptionLabel.backgroundColor = UIColor.darkGray
        descriptionLabel.textAlignment = NSTextAlignment.center
    }
    
    func initProfileImage() {
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 0.5 * self.profileImageView.bounds.width
        profileImageView.image = UIImage(named: "good_lion.png")
    }

    @IBAction func editButtonTouched(_ sender: UIButton) {
        nameLable.textColor = UIColor.blue
        nameLable.backgroundColor = UIColor.yellow
        nameLable.alpha = 0.5
        descriptionLabel.text = "크루미션"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditViewController {
            destination.nameText = nameLable.text
            destination.descriptionText = descriptionLabel.text
            destination.delegate = self
        }
    }
    
    func sendProfile(profileImage: UIImage, name: String, description: String) {
        nameLable.text = name
        descriptionLabel.text = description
        profileImageView.image = profileImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#file, #line, #function, #column)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#file, #line, #function, #column)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(#file, #line, #function, #column)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(#file, #line, #function, #column)
    }
}
