//
//  ViewController.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/18.
//

import UIKit

class ProfileViewController: UIViewController, EditProfileDataProtocol {

    var nameText : String?
    var descriptionText: String?
    var profileImage: UIImage?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func editButtonTouched(_ sender: Any) {
        nameLabel.textColor = UIColor.blue
        nameLabel.backgroundColor = UIColor.yellow
        nameLabel.alpha = 0.5
        descriptionLabel.text = "크루미션"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#file, #line, #function, #column)
        
        initUI()
    }

    private func initUI() {
        profileImageView.contentMode = .scaleAspectFill

        nameLabel.font = UIFont.systemFont(ofSize: 24)
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
    
        nameLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
        
        nameText = "River"
        descriptionText = "카르페 디엠"

        setUI()
    }
    
    private func setUI() {
        profileImageView.image = profileImage
        nameLabel.text = nameText
        descriptionLabel.text = descriptionText

        nameLabel.sizeToFit()
        descriptionLabel.sizeToFit()
        
        nameLabel.center.x = view.frame.width / 2
        descriptionLabel.center.x = view.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditViewController {
            destination.nameText = nameLabel.text
            destination.descriptionText = descriptionLabel.text
            destination.profileImage = profileImageView.image

            destination.profileDelegate = self
        }
    }
    
    func sendProfileData(nameText: String?, descriptionText: String?, profileImage: UIImage?) {
        self.nameText = nameText
        self.descriptionText = descriptionText
        self.profileImage = profileImage
        
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#file, #line, #function, #column)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#file, #line, #function, #column)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#file, #line, #function, #column)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#file, #line, #function, #column)
    }
}

