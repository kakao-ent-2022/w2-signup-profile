//
//  Validation.swift
//  KakaoProfile
//
//  Created by nylah.j on 2022/01/22.
//

import UIKit

class ValidationTextView: UIView {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak internal var inputTextField: UITextField!
    @IBOutlet weak internal var cautionLabel: UILabel!
    
    var validationDelgate: ValidationDelegate? 
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.loadXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXib()
        inputTextField.addTarget(self,
                                 action: #selector(inputTextFieldDidChange(_:)),
                                 for: .editingChanged)
    }
    
    private func loadXib() {
        let identifier = String(describing: type(of: self))
        print(identifier)
        let nib = Bundle.main.loadNibNamed(identifier, owner: self)
        guard let validationView = nib?.first as? UIView else { return }
        validationView.frame = self.bounds
        self.addSubview(validationView)
    }
    
    @objc func inputTextFieldDidChange(_ textField: UITextField) {
        guard let result = validationDelgate?.validate(value: textField.text)
        else {
            cautionLabel.isHidden = true
            return
        }
        
        cautionLabel.isHidden = false
        cautionLabel.text = result.value
        
        if result.isIdealResult {
            cautionLabel.textColor = UIColor.green
            return
        }
        cautionLabel.textColor = UIColor.red
    }
    
    func setTitle(title: String) {
        titleLabel.text = title
    }
    
    func setInputPlaceHolder(placeHolder: String) {
        inputTextField.placeholder = placeHolder
    }
    
    func setInputDelegate(delegate: UITextFieldDelegate) {
        inputTextField.delegate = delegate
    }
    
    func setCautionByValidationResult(result: ValidationResult) {
        cautionLabel.text = result.value
    }
    
    func getValidInputOrNil() -> String? {
        let input = inputTextField.text
        guard let result = validationDelgate?.validate(value: input),
              result.isIdealResult
        else {
            return nil
        }
        return input
    }
}

class StandardValidationTextView: ValidationTextView {
  
    init(validationDeleagate: RePasswordValidationDelegate, frame: CGRect) {
        super.init(frame: frame)
        self.validationDelgate = validationDeleagate
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

    override func inputTextFieldDidChange(_ textField: UITextField)  {
        let validationDelgate = validationDelgate as! RePasswordValidationDelegate
        validationDelgate.standard = inputTextField.text
        let result = validationDelgate.validate(value: textField.text)
       
        cautionLabel.isHidden = false
        cautionLabel.text = result.value
        
        if result.isIdealResult {
            cautionLabel.textColor = UIColor.green
            return
        }
        cautionLabel.textColor = UIColor.red
    }
}

