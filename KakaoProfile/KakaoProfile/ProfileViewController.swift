//
//  ViewController.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/18.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func editButtonTouched(_ sender: Any) {
        self.nameLabel.textColor = UIColor.blue
        self.nameLabel.backgroundColor = UIColor.yellow
        self.nameLabel.alpha = 0.5
        self.descriptionLabel.text = "크루미션"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#file, #line, #function, #column)
        
        self.initUI()
    }

    private func initUI() {
        self.nameLabel.text = "River"
        self.descriptionLabel.text = "카르페 디엠"
        
        self.nameLabel.font = UIFont.systemFont(ofSize: 24)
        self.descriptionLabel.font = UIFont.systemFont(ofSize: 15)

        self.nameLabel.sizeToFit()
        self.descriptionLabel.sizeToFit()
        
        self.nameLabel.textAlignment = .center
        self.descriptionLabel.textAlignment = .center
        
        self.nameLabel.center.x = self.view.frame.width / 2
        self.descriptionLabel.center.x = self.view.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditViewController {
            destination.nameText = self.nameLabel.text ?? ""
            destination.descriptionText = self.descriptionLabel.text ?? "" 
        }
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

