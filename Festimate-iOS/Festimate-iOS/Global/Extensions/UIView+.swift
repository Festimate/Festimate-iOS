//
//  UIView+.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/2/24.
//

import UIKit

extension UIView {
    
    // UIView 여러 개 인자로 받아서 한 번에 addSubview하는 메소드
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    // UIView 모서리 둥글게 해주는 메소드
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    
}

