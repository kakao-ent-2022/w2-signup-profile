//
//  SignUpViewController.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/19.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var headlineLabel: UILabel!
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var idCautionLabel: UILabel!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordCautionLabel: UILabel!
    
    @IBOutlet weak var rePasswordField: UITextField!
    @IBOutlet weak var rePasswordCautionLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameCautionLabel: UILabel!
    

    private var isIdValid: Bool = false
    private var isPasswordValid: Bool = false
    private var isRePasswordSame: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onNextButtonTouched(_ sender: UIButton) {
        let isNameValid = checkName(name: nameField.text)
        
        if !isNameValid
            || !isIdValid
            || !isPasswordValid
            || !isRePasswordSame {
            return
        }
        
        guard let id = idField.text,
              let password = passwordField.text else {
            return
        }
        
        Task.init {
            let isSignUpSuccess = await trySingUp(id: id, password: password)
            
            if(isSignUpSuccess) {
                navigateToLogin()
            }
        }
    }
    
    private func navigateToLogin() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "loginViewController")
        controller?.transitioningDelegate = self
        controller?.modalPresentationStyle = .custom
        present(controller!, animated: true)
    }
    
    private func trySingUp(id: String, password: String) async -> Bool {
        do {
            try await NetworkHandler.postSignUp(id: id, password: password)
            
            guard let user = User(id: id, password: password) else {
                throw NetworkError.paramsError
            }
            UserStorage.save(user: user)
            return true
            
        } catch NetworkError.paramsError  {
            print("Network Error: id or passwor is empty")
        } catch NetworkError.duplicateId {
            idCautionLabel.text = IdValidationResult.duplication.value

        } catch NetworkError.parseError {
            print("Network Error: URL Parse Error")
        } catch {
            print("Network Error: UnKnown Error Occured")
        }
        return false
    }
    
    private func checkName(name: String?) -> Bool {
        guard let name = nameField.text,
              name.count > 0
        else {
            nameCautionLabel.isHidden = false
            return false
        }
        
        nameCautionLabel.isHidden = true
        return true
    }

    @IBAction func onIdFieldChanging(_ sender: UITextField) {
        isIdValid = IdChecker.checkId(id: sender.text)
        
        idCautionLabel.isHidden = false
        
        if isIdValid {
            idCautionLabel.text = IdValidationResult.usableness.value
            idCautionLabel.textColor = UIColor.green
            return
        }
        
        idCautionLabel.text = IdValidationResult.invalidFormat.value
        idCautionLabel.textColor = UIColor.red
    }
    
    
    @IBAction func onPasswordFieldChanging(_ sender: UITextField) {
        passwordCautionLabel.isHidden = false
        
        guard let password = sender.text,
              PasswordChecker.checkSize(password: password)
        else {
            setPasswordCaution(content: .invalidSize)
            isPasswordValid = false
            return
        }
        
        if(!PasswordChecker.checkHasUpper(password: password)) {
            setPasswordCaution(content: .uppercaseNonExist)
            isPasswordValid = false
            return
        }
        
        if(!PasswordChecker.checkHasNumber(password: password)) {
            setPasswordCaution(content: .numberNonExist)
            isPasswordValid = false
            return
        }
        
        if(!PasswordChecker.checkHasSpecialSymbol(password: password)) {
            setPasswordCaution(content: .specialSymbolNonExist)
            isPasswordValid = false
            return
        }
                
        setPasswordCaution(content: .usableness)
        isPasswordValid = true
    }
    
    private func setPasswordCaution(content: PasswordCautionContent) {
        passwordCautionLabel.text = content.value
        
        switch content {
        case .usableness:
            passwordCautionLabel.textColor = UIColor.green
        case .invalidSize,
            .numberNonExist,
            .specialSymbolNonExist,
            .uppercaseNonExist:
            passwordCautionLabel.textColor = UIColor.red
        }
    }
    
    @IBAction func onRePasswordFieldChanging(_ sender: UITextField) {
        rePasswordField.isHidden = false
        
        guard let password = passwordField.text,
              let rePassword = sender.text
        else {
            setRePasswordCaution(content: RePasswordCautionContent.nonMatch)
            isRePasswordSame = false
            return
        }
        
        if password != rePassword {
            setRePasswordCaution(content: RePasswordCautionContent.nonMatch)
            isRePasswordSame = false
            return
        }
        
        setRePasswordCaution(content: .match)
        isRePasswordSame = true
        return
    }
    
    private func setRePasswordCaution(content: RePasswordCautionContent) {
        rePasswordCautionLabel.text = content.value
        
        switch content {
        case .match:
            rePasswordCautionLabel.textColor = UIColor.green
        case .nonMatch:
            rePasswordCautionLabel.textColor = UIColor.red
        }
    }
}

extension SignUpViewController: UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let frame = self.view.frame
        return NavigationTransition(originFrame: frame)
    }
}
