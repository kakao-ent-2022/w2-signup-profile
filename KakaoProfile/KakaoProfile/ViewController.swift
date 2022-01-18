//
//  ViewController.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initRoot()
        initNameLabel()
        initDescriptionLabel()
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
        self.nameLable.textAlignment = NSTextAlignment.center
    }
    
    func initDescriptionLabel() {
        self.descriptionLabel.text = "카르페 디엠"
        self.descriptionLabel.textColor = UIColor.brown
        self.descriptionLabel.backgroundColor = UIColor.darkGray
    }

    @IBAction func editButtonTouched(_ sender: UIButton) {
        self.nameLable.textColor = UIColor.blue
        self.nameLable.backgroundColor = UIColor.yellow
        self.nameLable.alpha = 0.5
        self.descriptionLabel.text = "크루미션"
    }
}
