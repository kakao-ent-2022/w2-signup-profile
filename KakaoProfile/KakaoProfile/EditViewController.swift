//
//  EditViewController.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/18.
//

import UIKit
import PhotosUI

class EditViewController: UIViewController {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameTextEdit: UITextField!
    @IBOutlet var descriptionTextEdit: UITextField!
    var profile: Profile!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 3
        
        if profile == nil {
            profile = Profile(name: "", description: "", image: nil)
        }
        profileImage.image = profile.image
        nameTextEdit.text = profile.name
        descriptionTextEdit.text = profile.description
    }
    
    @IBAction func selectImageButtonTouched(_ sender: UIButton) {
        if hasPermissionToAlbum() {
            presentPicker()
        } else {
            requestPermissionToAlbum()
        }
    }
    @IBAction func cancelButtonTouched(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTouched(_ sender: UIButton) {
        profile.confirmNewProfile(name: nameTextEdit.text, description: descriptionTextEdit.text, image: nil )
        dismiss(animated: true, completion: nil)
    }
    @IBAction func clearNameButtonTouched(_ sender: UIButton) {
        nameTextEdit.text = ""
    }
    @IBAction func clearDescriptionButtonTouched(_ sender: UIButton) {
        descriptionTextEdit.text = ""
    }
    
    
    private func hasPermissionToAlbum() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        return status == .authorized
    }
    
    private func requestPermissionToAlbum() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite, handler: { status -> Void in })
    }
    
    private func presentPicker() {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = .images
        configuration.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
}

extension EditViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        if let result = results.first {
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                let _ = itemProvider.loadObject(ofClass: UIImage.self) { [weak self] UIImage, error in
                        DispatchQueue.main.async {
                            self?.handleCompletion(assetIdentifier: result.assetIdentifier!, object: UIImage, error: error)
                        }
                    }
            }
        }
    }
    
    private func handleCompletion(assetIdentifier: String, object: Any?, error: Error? = nil) {
        if let image = object as? UIImage {
            profileImage.image = image
            profile.image = image

        } else if let error = error {
            print("Couldn't display \(assetIdentifier) with error: \(error)")
        } else {
            print("Couldn't display \(assetIdentifier)")
        }
    }
    
}
