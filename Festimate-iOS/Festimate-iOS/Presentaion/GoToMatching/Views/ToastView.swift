//
//  ToastView.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/21/24.
//

import UIKit

import SnapKit
import Then

class ToastView: UIView {
    
    // MARK: - UI Properties

    let toastText: UILabel = UILabel()
    
    // MARK: - Properties
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        addSubview(toastText)
    }
    
    func setLayout() {
        toastText.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.do {
            $0.backgroundColor = .gray05
            $0.layer.cornerRadius = 7
        }
        
        toastText.do {
            $0.setLabel(text: "계좌 번호가 복사되었어요!", textColor: .fmWhite, font: .pretendard(.body_med_15))
        }
    }
    
}



