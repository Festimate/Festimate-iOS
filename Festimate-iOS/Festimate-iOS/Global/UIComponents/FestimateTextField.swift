//
//  FestimateTextField.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit

import SnapKit
import Then

class FestimateTextField: UITextField {
    
    init(placeHolder: String) {
        super.init(frame: .zero)
        
        self.setPlaceholder(placeHolder, color: .gray04)
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.borderStyle = .none
        self.layer.cornerRadius = 11
        self.backgroundColor = .gray01
        self.padding(value: 15)
    }
}
