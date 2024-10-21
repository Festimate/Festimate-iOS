//
//  DressInfoView.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/19/24.
//

import UIKit

import SnapKit
import Then

class DressInfoView: UIView {
    
    // MARK: - UI Properties

    let backButton: UIButton = UIButton()
    
    private let titleLabel: UILabel = UILabel()
    
    private let dressImageView: UIImageView = UIImageView(image: .dress)
    
    private let infoIcon: UIImageView = UIImageView(image: .infoIcon)
    
    private let infoLabel: UILabel = UILabel()
    
    private let triangleView: UIImageView = UIImageView(image: .triangle)
        
    let dressInfoTextView: UITextView = UITextView()
    
    let textCountLabel: UILabel = UILabel()

    let completeButton: UIButton = UIButton()
    
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
        addSubviews(
            backButton,
            titleLabel,
            dressImageView,
            infoIcon,
            infoLabel,
            triangleView,
            dressInfoTextView,
            textCountLabel,
            completeButton
        )
    }
    
    func setLayout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview()
            $0.size.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(133)
            $0.leading.equalToSuperview().inset(16)
        }
        
        dressImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(134)
            $0.height.equalTo(137)
        }
        
        infoIcon.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.equalTo(titleLabel)
            $0.size.equalTo(16)
        }
        
        infoLabel.snp.makeConstraints {
            $0.centerY.equalTo(infoIcon)
            $0.leading.equalTo(infoIcon.snp.trailing).offset(7)
        }
        
        triangleView.snp.makeConstraints {
            $0.bottom.equalTo(dressInfoTextView.snp.top).offset(5)
            $0.leading.equalTo(dressInfoTextView).inset(26)
        }
        
        dressInfoTextView.snp.makeConstraints {
            $0.top.equalTo(infoIcon.snp.bottom).offset(60)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(98)
        }
        
        textCountLabel.snp.makeConstraints {
            $0.top.equalTo(dressInfoTextView.snp.bottom).offset(14)
            $0.trailing.equalTo(dressInfoTextView)
        }
        
        completeButton.snp.makeConstraints {
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
            $0.setLabel(text: "당신을 찾을 수 있는\n착장 정보를 알려주세요!", alignment: .left, textColor: .gray06, font: .pretendard(.title_bold_18))
            $0.setColorForText("착장 정보", with: .mainCoral)
        }
        
        infoLabel.do {
            $0.setLabel(text:"오프라인에서 Festimate를 찾는데 도움이 돼요!", textColor: .gray04, font: .pretendard(.body_med_13))
        }
        
        dressInfoTextView.do {
            $0.text = "ex) 저는 회색 가디건에 청치마를 입고 있어요!"
            $0.font = .pretendard(.body_med_15)
            $0.textColor = .gray04
            $0.textContainerInset = UIEdgeInsets(top: 18, left: 16, bottom: 18, right: 16)
            $0.isScrollEnabled = false
            $0.textAlignment = .left
            $0.layer.cornerRadius = 9
            $0.backgroundColor = .gray01
            $0.autocorrectionType = .no
            $0.spellCheckingType = .no
        }
        
        textCountLabel.do {
            $0.setLabel(text: "0/50", textColor: .gray04, font: .pretendard(.body_med_13))
        }
        
        completeButton.do {
            $0.setButton(title: "완료", backgroundColor: .gray03)
        }
    }
    
}


