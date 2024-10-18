//
//  AddMatchingView.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/12/24.
//

import UIKit

import SnapKit
import Then

class AddMatchingView: UIView {
    
    // MARK: - UI Properties

    let backButton: UIButton = UIButton()
    
    private let titleLabel: UILabel = UILabel()
    
    private let infoIcon: UIImageView = UIImageView(image: .infoIcon)
    
    private let infoLabel: UILabel = UILabel()
    
    private let infoStackView: UIStackView = UIStackView()
    
    let idealTypeButton: AddMatchingButton = AddMatchingButton()
    
    let preferenceButton: AddMatchingButton = AddMatchingButton()
    
    private let buttonStackView: UIStackView = UIStackView()
    
    private let characterImageView: UIImageView = UIImageView(image: .normalCharacter)
    
    private let speechBubble: UIImageView = UIImageView(image: .speechBubbleCoral)
    
    private let speechBubbleLabel: UILabel = UILabel()
    
    private let matcingInfoLabel: UILabel = UILabel()
    
    let matchingButton: UIButton = UIButton()
    
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
        infoStackView.addArrangedSubviews(infoIcon, infoLabel)
        buttonStackView.addArrangedSubviews(idealTypeButton, preferenceButton)
        
        addSubviews(
            backButton,
            characterImageView,
            titleLabel,
            infoStackView,
            buttonStackView,
            speechBubble,
            speechBubbleLabel,
            matchingButton
        )
    }
    
    func setLayout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview()
            $0.size.equalTo(44)
        }
        
        characterImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.trailing.equalToSuperview().inset(-44)
            $0.size.equalTo(134.5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.centerX.equalToSuperview()
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }
        
        idealTypeButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(93)
        }
        
        preferenceButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(93)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        speechBubble.snp.makeConstraints {
            $0.bottom.equalTo(matchingButton.snp.top).offset(-12)
            $0.leading.equalTo(matchingButton)
            $0.width.equalTo(232)
            $0.height.equalTo(53)
        }
        
        speechBubbleLabel.snp.makeConstraints {
            $0.centerX.equalTo(speechBubble)
            $0.top.equalTo(speechBubble).inset(11)
        }
        
        matchingButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(38)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
    }
    
    func setStyle() {
        self.backgroundColor = .white
        
        backButton.do {
            $0.setImage(.backIcon, for: .normal)
        }
        
        titleLabel.do {
            $0.setLabel(text:"두근두근\n나의 FestiMate를 찾아봐요", textColor: .gray06, font: .pretendard(.title_bold_20))
        }
        
        infoLabel.do {
            $0.setLabel(text: "2개의 항목을 모두 입력해주세요", textColor: .gray04, font: .pretendard(.body_med_13))
        }
        infoStackView.do {
            $0.axis = .horizontal
            $0.alignment = .top
            $0.spacing = 7
        }
        
        speechBubbleLabel.do {
            $0.setLabel(text: "모두 입력해야 매칭이 시작됩니다!", textColor: .mainCoral, font: .pretendard(.body_semi_13))
        }
        
        idealTypeButton.do {
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.gray02.cgColor
            $0.roundCorners(cornerRadius: 11, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        }
        
        preferenceButton.do {
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.gray02.cgColor
            $0.roundCorners(cornerRadius: 11, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            $0.titleLabel.text = "연애 취향"
            $0.subTitleLabel.text = "나와 얼마나 잘 맞을까?"
        }

        buttonStackView.do {
            $0.axis = .vertical
            $0.spacing = 16
        }
        
        matchingButton.do {
            $0.setButton(title: "매칭하러 가기", backgroundColor: .gray03)
        }
        
        
    }
    
}

