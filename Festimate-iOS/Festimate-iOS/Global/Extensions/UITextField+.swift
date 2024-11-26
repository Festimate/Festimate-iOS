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
    
    func rightPadding(value: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setPlaceholder(_ text: String, color: UIColor) {
            attributedPlaceholder = NSAttributedString(
                string: text,
                attributes: [.foregroundColor: color]
            )
        }
    
    func setStyle(placeholder: String, font: UIFont = UIFont.pretendard(.body_med_15), size: CGFloat = 13, backgroundColor: UIColor = UIColor(resource: .gray01), textColor: UIColor = .gray06, cornerRadius: CGFloat = 11, leftPadding: CGFloat = 11) {
        
        self.font = font
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: self.frame.height))
        self.leftViewMode = .always
        self.textColor = textColor

        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray04,
            .font: font
        ]
        
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
}
