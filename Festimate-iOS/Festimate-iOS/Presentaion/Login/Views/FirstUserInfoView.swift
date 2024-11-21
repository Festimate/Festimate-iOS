//
//  FirstUserInfoView.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit

import SnapKit
import Then

class FirstUserInfoView: UIView {
    
    private let nameLabel = UILabel()
    
    private let nameInfoIcon = UIImageView(image: .infoIcon)
    
    private let nameInfoLabel = UILabel()
    
    private let nameTextField = FestimateTextField(placeHolder: "이름을 입력해주세요")
    
    private let nicknameLabel = UILabel()
    
    private let nicknameTextField = FestimateTextField(placeHolder: "닉네임을 입력해주세요")
    
    private lazy var nicknameValidateButton = UIButton()
    
    private let nicknameErrorLabel = UILabel()
    
    private let ageLabel = UILabel()
    
    private let ageTextField = FestimateTextField(placeHolder: "나이를 입력해주세요")
    
    private let genderLabel = UILabel()
    
    private let genderButtonStackView = UIStackView()
    
    private lazy var womanButton = UIButton()
    
    private lazy var manButton = UIButton()
    
    private let schoolLabel = UILabel()
    
    private let schoolInfoIcon = UIImageView(image: .infoIcon)
    
    private let schoolInfoLabel = UILabel()
    
    private let schoolTextField = FestimateTextField(placeHolder: "예) 가톨릭대학교")
    
    init() {
        super.init(frame: .zero)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        addSubviews(nameLabel, nameInfoIcon, nameInfoLabel, nameTextField, nicknameLabel, nicknameTextField, nicknameErrorLabel, ageLabel, ageTextField, genderLabel, genderButtonStackView, schoolLabel, schoolInfoIcon, schoolInfoLabel, schoolTextField)
        
        genderButtonStackView.addArrangedSubviews(womanButton, manButton)
        
        nicknameTextField.addSubview(nicknameValidateButton)
    }
    
    func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(16)
        }
        
        nameInfoIcon.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(7)
            $0.centerY.equalTo(nameLabel)
        }
        
        nameInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(nameInfoIcon.snp.trailing).offset(4)
            $0.centerY.equalTo(nameInfoIcon)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(nameTextField.snp.bottom).offset(14)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        nicknameValidateButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(9)
            $0.trailing.equalToSuperview().offset(-12)
            $0.width.equalTo(88)
        }
        
        nicknameErrorLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(4)
        }
        
        ageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(nicknameErrorLabel.snp.bottom).offset(4)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        genderLabel.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(14)
            $0.leading.equalToSuperview()
        }
        
        genderButtonStackView.snp.makeConstraints {
            $0.top.equalTo(genderLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        schoolLabel.snp.makeConstraints {
            $0.top.equalTo(genderButtonStackView.snp.bottom).offset(14)
            $0.leading.equalToSuperview()
        }
        
        schoolInfoIcon.snp.makeConstraints {
            $0.centerY.equalTo(schoolLabel)
            $0.leading.equalTo(schoolLabel.snp.trailing).offset(7)
        }
        
        schoolInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(schoolLabel)
            $0.leading.equalTo(schoolInfoIcon.snp.trailing).offset(4)
        }
        
        schoolTextField.snp.makeConstraints {
            $0.top.equalTo(schoolLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    func setStyle() {
        nameLabel.do {
            $0.setLabel(text: "이름 *", textColor: .gray06, font: .pretendard(.body_semi_17))
            $0.setColorForText("*", with: .mainCoral)
        }
        
        nameInfoLabel.do {
            $0.setLabel(text: "계좌 이체 시 확인용으로 사용되며, 공개되지 않아요", textColor: .gray04, font: .pretendard(.cap_reg_11))
        }
        
        nicknameLabel.do {
            $0.setLabel(text: "닉네임 *", textColor: .gray06, font: .pretendard(.body_semi_17))
            $0.setColorForText("*", with: .mainCoral)
        }
        
        nicknameValidateButton.do {
            $0.setButton(title: "중복확인", backgroundColor: .gray03, titleColor: .white, font: .pretendard(.body_semi_13), cornerRadius: 9)
            $0.isEnabled = false
        }
        
        nicknameErrorLabel.do {
            $0.setLabel(text: "한글만 가능, 최소 1자 - 최대 10자", textColor: .gray04, font: .pretendard(.cap_reg_11))
        }
        
        ageLabel.do {
            $0.setLabel(text: "나이 *", textColor: .gray06, font: .pretendard(.body_semi_17))
            $0.setColorForText("*", with: .mainCoral)
        }
        
        genderLabel.do {
            $0.setLabel(text: "성별 *", textColor: .gray06, font: .pretendard(.body_semi_17))
            $0.setColorForText("*", with: .mainCoral)
        }
        
        genderButtonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 13
            $0.distribution = .fillEqually
        }
        
        womanButton.do {
            $0.setButton(title: "여자", backgroundColor: .gray01, titleColor: .gray04, font: .pretendard(.body_semi_15), cornerRadius: 11)
        }
        
        manButton.do {
            $0.setButton(title: "남자", backgroundColor: .gray01, titleColor: .gray04, font: .pretendard(.body_semi_15), cornerRadius: 11)
        }
        
        schoolLabel.do {
            $0.setLabel(text: "학교", textColor: .gray06, font: .pretendard(.body_semi_17))
        }
        
        schoolInfoLabel.do {
            $0.setLabel(text: "학교 정보를 공개하고 싶지 않으시면 미입력해주세요", textColor: .gray04, font: .pretendard(.cap_reg_11))
        }
    }
}
