//
//  UITextField+.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit

extension UITextField {
    func padding(value: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setPlaceholder(_ text: String, color: UIColor) {
            attributedPlaceholder = NSAttributedString(
                string: text,
                attributes: [.foregroundColor: color]
            )
        }
}
