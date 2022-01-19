//
//  SignUpTextFieldView.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/19.
//

import UIKit

class SignUpTextFieldView: UIView {
    
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
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func updateTitle(title: String) {
        self.titleLabel.text = title
    }
    
    func updateCaption(caption: String) {
        self.captionLabel.text = caption
    }
    
    func updatePlaceholder(placeHolder: String) {
        self.textField.placeholder = placeHolder
    }
    
    private func loadXib() {
        let identifier = String(describing: type(of: self))
        let nibs = Bundle.main.loadNibNamed(identifier, owner: self, options: nil)
        guard let SignUpTextFieldView = nibs?.first as? UIView else { return }
        SignUpTextFieldView.frame = self.bounds
        self.addSubview(SignUpTextFieldView)
    }
}
