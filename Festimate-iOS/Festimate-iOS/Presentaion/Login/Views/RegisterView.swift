//
//  RegisterView.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit

import SnapKit
import Then

class RegisterView: UIView {
    
    private lazy var backButton = UIButton()
    
    private let numberLabel = UILabel()
    
    private let titleLabel = UILabel()
    
    private let containerView = UIView()
    
    private lazy var registerButton = UIButton()
    
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
        addSubviews(backButton, numberLabel, titleLabel, containerView, registerButton)
    }
    
    func setLayout() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(50)
            $0.width.height.equalTo(44)
        }
        
        numberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(87)
            $0.width.height.equalTo(31)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberLabel.snp.bottom).offset(9)
        }
        
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.bottom.equalTo(registerButton.snp.top)
        }
        
        registerButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-59)
            $0.height.equalTo(54)
        }
    }
    
    func setStyle() {
        self.backgroundColor = .white
        
        backButton.do {
            $0.setImage(UIImage(named: "back_icon"), for: .normal)
        }
        
        numberLabel.do {
            $0.setLabel(text: "1", numberOfLines: 1, textColor: .white, font: .pretendard(.body_bold_15))
            $0.backgroundColor = .mainCoral
            $0.layer.cornerRadius = 15.5
            $0.layer.masksToBounds = true
        }
        
        titleLabel.do {
            $0.setLabel(text: "내 정보 입력", numberOfLines: 1, textColor: .gray06, font: .pretendard(.title_bold_20))
        }
        
        registerButton.do {
            $0.setButton(
                title: "다음",
                backgroundColor: .mainCoral,
                titleColor: .white,
                font: .pretendard(.body_semi_17),
                cornerRadius: 11
            )
        }
    }
}
