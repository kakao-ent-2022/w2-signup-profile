//
//  SignUpTextFieldView.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/19.
//

import UIKit
protocol TextViewDelegate {
    func updateTitle(title: String)
    func updateCaption(caption: String, color: UIColor)
    func updateTextField(color: CGColor)
}

class CustomTextView: UIView, TextViewDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var captionLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXib()
        updateInitialStyle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadXib()
        updateInitialStyle()
    }
    
    func updateInitialStyle() {
        updateCaption(caption: "")
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1 
    }

    func updateTitle(title: String) {
        self.titleLabel.text = title
    }

    func updateCaption(caption: String, color: UIColor = .black) {
        self.captionLabel.text = caption
        self.captionLabel.textColor = color
    }
    
    func updatePlaceholder(placeHolder: String) {
        self.textField.placeholder = placeHolder
    }
    
    func updateTextField(color: CGColor) {
        self.textField.layer.borderColor = color
    }
    
    private func loadXib() {
        let identifier = String(describing: type(of: self))
        let nibs = Bundle.main.loadNibNamed(identifier, owner: self, options: nil)
        guard let SignUpTextFieldView = nibs?.first as? UIView else { return }
        SignUpTextFieldView.frame = self.bounds
        self.addSubview(SignUpTextFieldView)
    }
}
