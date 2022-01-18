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
    private var profileImage =  UIImage(named: "good_lion.png")
    
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
        self.nameLable.text = "JK"
        self.nameLable.textColor = UIColor.cyan
        self.nameLable.font = self.nameLable.font.withSize(25)
        self.nameLable.layer.shadowOpacity = 0.5
        self.nameLable.textAlignment = NSTextAlignment.center
    }
    
    func initDescriptionLabel() {
        self.descriptionLabel.text = "카르페 디엠"
        self.descriptionLabel.textColor = UIColor.brown
        self.descriptionLabel.backgroundColor = UIColor.darkGray
        self.descriptionLabel.textAlignment = NSTextAlignment.center
    }
    
    func initProfileImage() {
        self.profileImageView.clipsToBounds = true
        self.profileImageView.layer.cornerRadius = 0.5 * self.profileImageView.bounds.width
        self.profileImageView.image = self.profileImage
    }

    @IBAction func editButtonTouched(_ sender: UIButton) {
        self.nameLable.textColor = UIColor.blue
        self.nameLable.backgroundColor = UIColor.yellow
        self.nameLable.alpha = 0.5
        self.descriptionLabel.text = "크루미션"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditViewController {
            destination.nameText = self.nameLable.text ??   ""
            destination.descriptionText = self.descriptionLabel.text ?? ""
            destination.delegate = self
        }
    }
    
    func sendProfile(profileImage: UIImage, name: String, description: String) {
        self.nameLable.text = name
        self.descriptionLabel.text = description
        self.profileImage =  profileImage
        self.profileImageView.image = self.profileImage
        dismiss(animated: true, completion: nil)
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
