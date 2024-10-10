//
//  MainView.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/4/24.
//

import UIKit

import SnapKit
import Then

class MainView: UIView {
    
    // MARK: - UI Properties

    private let welcomeLabel: UILabel = UILabel()
    
    private let nicknameLabel: UILabel = UILabel()
    
    private let dearLabel: UILabel = UILabel()
    
    private let schoolIcon: UIImageView = UIImageView(image: .schoolIcon)
    
    private let schoolLabel: UILabel = UILabel()
    
    let cardView: CardView = CardView()
    
    private let infoIcon: UIImageView = UIImageView(image: .infoIcon)
    
    private let infoLabel: UILabel = UILabel()
    
    private let infoStackView: UIStackView = UIStackView()
    
    private let addMatchingButton: UIButton = UIButton()
    
    // MARK: - Properties
    
    private let cardViewHeight: Int = Int(ScreenUtils.height * 0.43)
    
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
        
        addSubviews(
            welcomeLabel,
            nicknameLabel,
            dearLabel,
            schoolIcon,
            schoolLabel,
            infoStackView,
            cardView,
            addMatchingButton
        )
    }
    
    func setLayout() {
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.leading.equalToSuperview().inset(26)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(2)
            $0.leading.equalTo(welcomeLabel)
        }
        
        dearLabel.snp.makeConstraints {
            $0.bottom.equalTo(nicknameLabel)
            $0.leading.equalTo(nicknameLabel.snp.trailing).offset(2)
        }
        
        schoolIcon.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(21)
            $0.leading.equalTo(welcomeLabel)
            $0.width.equalTo(16)
            $0.height.equalTo(14)
        }
        
        schoolLabel.snp.makeConstraints {
            $0.centerY.equalTo(schoolIcon)
            $0.leading.equalTo(schoolIcon.snp.trailing).offset(7)
        }
        
        infoIcon.snp.makeConstraints {
            $0.size.equalTo(16)
        }
        
        infoStackView.snp.makeConstraints {
            $0.bottom.equalTo(addMatchingButton.snp.top).offset(-89)
            $0.centerX.equalToSuperview()
        }
        
        cardView.snp.makeConstraints {
            $0.top.equalTo(schoolLabel.snp.bottom).offset(28)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(cardViewHeight)

        }
        
        addMatchingButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(38)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
    }
    
    func setStyle() {
        self.backgroundColor = .gray01
        
        welcomeLabel.do {
            $0.setLabel(text: "안녕하세요", textColor: .gray06, font: .pretendard(.title_bold_20))
        }
        
        nicknameLabel.do {
            $0.setLabel(text: "아기고양이", textColor: .mainCoral, font: .pretendard(.title_extra_24))
        }
        
        dearLabel.do {
            $0.setLabel(text: "님", textColor: .gray06, font: .pretendard(.title_bold_20))
        }
        
        schoolLabel.do {
            $0.setLabel(text: "가톨릭대학교", textColor: .gray04, font: .pretendard(.body_semi_15))
        }
        
        infoLabel.do {
            $0.setLabel(text: "Festimate 매칭은 15시, 17시에\n순차적으로 업데이트 됩니다!", textColor: .gray04, font: .pretendard(.body_med_13))
        }
        
        infoStackView.do {
            $0.axis = .horizontal
            $0.alignment = .top
            $0.spacing = 7
        }
        
        addMatchingButton.do {
            $0.setButton(title: "매칭 추가하기")
        }

    }
    
}
