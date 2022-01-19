//
//  SignUpTextFieldView.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/19.
//

import UIKit

class SignUpTextFieldView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadXib()
    }
    
    private func loadXib() {
        let identifier = String(describing: type(of: self))
        let nibs = Bundle.main.loadNibNamed(identifier, owner: self, options: nil)
        
        guard let SignUpTextFieldView = nibs?.first as? UIView else { return }
        SignUpTextFieldView.frame = self.bounds
        self.addSubview(SignUpTextFieldView)
    }

}
