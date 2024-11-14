//
//  UITextField+.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/14/24.
//

import UIKit

extension UITextField {
    
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
