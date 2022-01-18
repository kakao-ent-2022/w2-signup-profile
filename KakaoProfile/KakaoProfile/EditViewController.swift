//
//  EditViewController.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/18.
//

import UIKit

class EditViewController: UIViewController {

    var nameText : String = ""
    var descriptionText: String = ""
    

    @IBOutlet weak var nameEditText: UITextField!
    @IBOutlet weak var descriptionEditText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    fileprivate func initUI() {
        self.nameEditText.text = nameText
        self.descriptionEditText.text = descriptionText
    }
    
}
