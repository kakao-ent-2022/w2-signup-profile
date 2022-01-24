//
//  SignUpViewController.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/19.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var idValidationTextView: ValidationTextView!
    @IBOutlet weak var passwordValidationTextView: ValidationTextView!
    @IBOutlet weak var rePasswordValidationTextView: StandardValidationTextView!
    @IBOutlet weak var nameValidationTextView: ValidationTextView!
    
    private var isIdValid: Bool = false
    private var isPasswordValid: Bool = false
    private var isRePasswordSame: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (hasLoginHistory()) {
            navigateToLogin()
        }
       
        initIdValidationTextView()
        initPasswordValidationTextView()
        initRePasswordValidationTextView()
        initNameValidationTextView()
    }
    
    func hasLoginHistory() -> Bool {
        guard let _ = UserStorage.get()
        else {
            return false
        }
        return true
    }
    
    func initIdValidationTextView() {
        idValidationTextView.setTitle(title: "아이디")
        idValidationTextView.setInputPlaceHolder(placeHolder: "영문 소문자, 숫자, 특수기호 (_, -), 5~20자")
        idValidationTextView.validationDelgate = IdValidationDelegate()
    }
    
    func initPasswordValidationTextView() {
        passwordValidationTextView.setTitle(title: "비밀번호")
        passwordValidationTextView.setInputPlaceHolder(placeHolder: "영문 대/소문자, 숫자, 특수문자!@#$%) 8~16자")
        passwordValidationTextView.validationDelgate = PasswordValidationDelegate()
    }
    
    func initRePasswordValidationTextView() {
        rePasswordValidationTextView.setTitle(title: "비밀번호 재확인")
        rePasswordValidationTextView.validationDelgate = RePasswordValidationDelegate()
    }
    
    func initNameValidationTextView() {
        nameValidationTextView.setTitle(title: "이름")
        nameValidationTextView.validationDelgate = NameValidationDelgate()
    }
    
    @IBAction func onNextButtonTouched(_ sender: UIButton) {
        guard let id = idValidationTextView.getValidInputOrNil(),
              let password = passwordValidationTextView.getValidInputOrNil(),
              let _ = rePasswordValidationTextView.getValidInputOrNil(),
              let name = nameValidationTextView.getValidInputOrNil()
        else {
            return
        }
    
        Task.init {
            let isSignUpSuccess = await trySingUp(id: id, password: password, name: name)
            
            if(isSignUpSuccess) {
                navigateToLogin()
            }
        }
    }
    
    private func navigateToLogin() {
        self.transitioningDelegate = self
        let controller = storyboard?.instantiateViewController(withIdentifier: "loginViewController")
        controller?.transitioningDelegate = self
        controller?.modalPresentationStyle = .custom
        present(controller!, animated: true)
    }
    
    private func trySingUp(id: String, password: String, name: String) async -> Bool {
        do {
            try await NetworkHandler.postSignUp(id: id, password: password)
            
            guard let user = User(name: name, id: id, password: password) else {
                throw NetworkError.paramsError
            }
            UserStorage.save(user: user)
            return true
            
        } catch NetworkError.paramsError  {
            print("Network Error: id or passwor is empty")
        } catch NetworkError.duplicateId {
            idValidationTextView.setCautionByValidationResult(result: IdValidationResult.duplication)

        } catch NetworkError.parseError {
            print("Network Error: URL Parse Error")
        } catch {
            print("Network Error: UnKnown Error Occured")
        }
        
        return false
    }
}

extension SignUpViewController: UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let frame = self.view.frame
        return NavigationTransition(originFrame: frame)
    }
}
