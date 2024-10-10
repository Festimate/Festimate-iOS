//
//  UIButton+.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/4/24.
//

import UIKit

extension UIButton {
    
    func setButton(title: String? = "",
                   backgroundColor: UIColor = .mainCoral,
                   titleColor: UIColor = .fmWhite,
                   font: UIFont = UIFont.pretendard(.body_semi_17),
                   cornerRadius: CGFloat = 9,
                   borderWidth: CGFloat = 0,
                   borderColor: UIColor = .clear) {
        
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}


