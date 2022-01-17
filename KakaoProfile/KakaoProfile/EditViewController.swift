//
//  EditViewController.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/17.
//

import UIKit

class EditViewController: UIViewController {
    var nameText : String?
    var descriptionText : String?
    var profileDataDelegate: ProfileDataDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var imageEditButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageEditButton.layer.cornerRadius = 0.5 * imageEditButton.bounds.size.width
        updateUI()
    }
    
    func updateUI() {
        nameTextField.text = nameText ?? ""
        descriptionTextField.text = descriptionText ?? ""
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTouched(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        profileDataDelegate?.updateProfile(name: name, description: description)
        dismiss(animated: true, completion: nil)
    }
    
    
    

}
