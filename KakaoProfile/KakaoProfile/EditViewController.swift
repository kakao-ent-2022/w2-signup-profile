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
    
    @IBOutlet weak var profileImage: UIImageView!
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
        let name = self.nameTextField.text ?? ""
        let description = self.descriptionTextField.text ?? ""
        guard let image = self.profileImage.image else { return } //선택된 이미지가 없을때 done버튼이 수행이 안되는게 맞을까?
        profileDataDelegate?.updateProfile(name: name, description: description, image: image)
        dismiss(animated: true, completion: nil)
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

    @IBAction func selectImageButtonTouched(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
}

extension EditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        guard let data = image.jpegData(compressionQuality: 0.1) else { return }
        self.profileImage.image = UIImage(data: data)
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}

