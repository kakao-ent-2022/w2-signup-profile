//
//  SignUpViewController.swift
//  KakaoProfile
//
//  Created by river.o on 2022/01/20.
//

import UIKit

enum SignUpConstant {
    static let onSignUpSuccessSegue = "onSignUpSuccess"
}

enum SignUpItem : Int, RawRepresentable {
    case id = 0
    case password = 1
    case passwordCheck = 2
    case name = 3
}

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idTextField: UITextField! {
        didSet{
            idTextField.tag = SignUpItem.id.rawValue
            idTextField.delegate = self
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet{
            passwordTextField.tag = SignUpItem.password.rawValue
            passwordTextField.delegate = self
        }
    }
    @IBOutlet weak var passwordCheckTextField: UITextField! {
        didSet{
            passwordCheckTextField.tag = SignUpItem.passwordCheck.rawValue
            passwordCheckTextField.delegate = self
        }
    }
    @IBOutlet weak var nameTextField: UITextField! {
        didSet{
            nameTextField.tag = SignUpItem.name.rawValue
            nameTextField.delegate = self
        }
    }
    
    @IBOutlet weak var idInformationLabel: UILabel!
    @IBOutlet weak var passwordInformationLabel: UILabel!
    @IBOutlet weak var passwordCheckInformationLabel: UILabel!
    @IBOutlet weak var nameInformationLabel: UILabel!
    
    private lazy var signUpTextFields = [idTextField, passwordTextField, passwordCheckTextField, nameTextField]
    private lazy var signUpLabels = [idInformationLabel, passwordInformationLabel, passwordCheckInformationLabel, nameInformationLabel]
    
    @IBAction func selectLoginButtonTouched(_ sender: Any) {
        signUp()
    }
    
    private let signUpValidation = SignUpValidation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }

    private func initUI() {
        idTextField.placeholder = "영문 소문자, 숫자, 특수기호(_,-), 5~20자"
        passwordTextField.placeholder = "영문 대/소문자, 숫자, 특수문자(!@#$%) 8~16자"
        
        for textField in signUpTextFields {
            textField?.returnKeyType = .next
        }
        signUpTextFields[signUpTextFields.count - 1]?.returnKeyType = .done
    }
    
    private func signUp() {
        performSegue(withIdentifier: SignUpConstant.onSignUpSuccessSegue, sender: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let tag = textField.tag
        if let text = textField.text {
            do {
                if tag != SignUpItem.name.rawValue && text.isEmpty {
                    textField.layer.borderWidth = 0.0
                    signUpLabels[tag]?.text = ""
                    return
                } else {
                    textField.layer.borderWidth = 1.0
                }
                
                let compareText = (tag == SignUpItem.passwordCheck.rawValue) ? passwordTextField.text : nil
                let signUpInformation = try signUpValidation.getValidationInformation(tag: tag, text: text, compareText: compareText)
                setSignUpInformationLabel(text: signUpInformation, tag: tag, isValidate: true)
            } catch SignUpValidationError.InvaildSignUpText(let errorMessage) {
                setSignUpInformationLabel(text: errorMessage, tag: tag, isValidate: false)
            } catch {
            }
        }
    }
    
    private func setSignUpInformationLabel(text: String, tag: Int, isValidate: Bool) {
        let textField = signUpTextFields[tag]
        let label = signUpLabels[tag]
        
        label?.text = text
        
        if(isValidate) {
            label?.textColor = UIColor.green
            textField?.layer.borderColor = UIColor.green.cgColor
        } else {
            label?.textColor = UIColor.red
            textField?.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if nextTag != signUpTextFields.count {
            signUpTextFields[nextTag]?.becomeFirstResponder()
        } else {
            signUp()
        }
        
        return true
    }
}
