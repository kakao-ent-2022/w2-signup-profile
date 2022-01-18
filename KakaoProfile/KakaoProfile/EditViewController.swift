//
//  EditViewController.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/18.
//

import UIKit
import PhotosUI

class EditViewController: UIViewController, PHPickerViewControllerDelegate {
    
    @IBOutlet var profileImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 3

    }
    
    @IBAction func selectImageButtonTouched(_ sender: UIButton) {
        if hasPermissionToAlbum() {
            presentPicker()
        } else {
            requestPermissionToAlbum()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
    }
    
    
    @IBAction func cancelButtonTouched(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
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
    
    func handleCompletion(assetIdentifier: String, object: Any?, error: Error? = nil) {
        if let image = object as? UIImage {
            profileImage.image = image

        } else if let error = error {
            print("Couldn't display \(assetIdentifier) with error: \(error)")
        } else {
            print("Couldn't display \(assetIdentifier)")
        }
    }
    
    
    func hasPermissionToAlbum() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        if (status == .authorized) {
            return true
        }
        return false
    }
    
    func requestPermissionToAlbum() {
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
