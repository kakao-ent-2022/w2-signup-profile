//
//  EditViewController.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/18.
//

import UIKit

class EditViewController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    var nameText: String = ""
    var descriptionText: String = ""
    
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    private let imagePickerController = UIImagePickerController()
    
    var delegate: EditViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPhotoPickerButton()
        initNameTextField()
        initDescriptoinTextField()
        initProfileImageView()

    }
    
    func initPhotoPickerButton() {
        selectImageButton.clipsToBounds = true
        selectImageButton.layer.cornerRadius = 0.5 * selectImageButton.bounds.size.width
        
        let profileImage = UIImage(named: "good_lion.png")
        profileImageView.image = profileImage
    }
    
    func initNameTextField() {
        nameTextField.clearButtonMode = .whileEditing
        nameTextField.text = nameText
    }
    
    func initDescriptoinTextField() {
        descriptionTextField.clearButtonMode = .whileEditing
        descriptionTextField.text = descriptionText
    }
    
    func initProfileImageView() {
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 0.5 * profileImageView.bounds.size.width
    }
    
    @IBAction func cancelButtonTouched(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func selectImageButtonTouched(_ sender: UIButton) {
        let isImageSelectionAvailable = UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        print("isImageSelectionAvailable: \(isImageSelectionAvailable)")
        
        let availableMediaTypes =  UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum)
        
        
        imagePickerController.mediaTypes = availableMediaTypes ?? []
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let originImage = info[.originalImage] as? UIImage
        profileImageView.image = originImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTouched(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let profileImage = profileImageView.image ?? UIImage()
        delegate?.sendProfile(profileImage: profileImage, name: name, description: description)
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
