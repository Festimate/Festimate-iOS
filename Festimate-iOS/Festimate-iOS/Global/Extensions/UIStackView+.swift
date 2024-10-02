//
//  UIStackView+.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/2/24.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
}
