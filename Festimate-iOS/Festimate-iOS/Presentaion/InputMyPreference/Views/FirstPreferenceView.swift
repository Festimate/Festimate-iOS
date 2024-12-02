//
//  FirstPreferenceView.swift
//  Festimate-iOS
//
//  Created by 김희은 on 11/16/24.
//

import UIKit

import SnapKit
import Then

class FirstPreferenceView: UIView {
    
    // MARK: - UI Properties

    let backButton: UIButton = UIButton()
    
    //progressBar 삽입!
    
    private let titleLabel: UILabel = UILabel()
    
    private let titleNumberImageView: UIImageView = UIImageView()
    
    private let titleStackView: UIStackView = UIStackView()
    
    let okayButton: AddMatchingButton = AddMatchingButton()
    
    let noButton: AddMatchingButton = AddMatchingButton()
    
    private let buttonStackView: UIStackView = UIStackView()
    
    let nextButton: UIButton = UIButton()
    
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
        titleStackView.addArrangedSubviews(titleNumberImageView, titleLabel)
        buttonStackView.addArrangedSubviews(okayButton, noButton)
        
        addSubviews(
            backButton,
            titleStackView,
            buttonStackView,
            nextButton
        )
    }
    
    func setLayout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview()
            $0.size.equalTo(44)
        }
        
        titleNumberImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(31)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(titleNumberImageView.snp.bottom).offset(7)
            $0.leading.equalToSuperview()
        }
        
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        okayButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(93)
        }
        
        noButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(93)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        nextButton.snp.makeConstraints {
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
            $0.setLabel(text: "이성친구와 단둘이 만나도 될까요?", textColor: .gray06, font: .pretendard(.title_bold_20))
        }
        
        titleNumberImageView.do {
            $0.image = UIImage(systemName: "1.circle.fill")
            //$0.frame.size = CGSize(width: 31, height: 31)
            $0.tintColor = .mainCoral
        }
        
        titleStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 7
        }
        
        okayButton.do {
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.gray02.cgColor
            $0.roundCorners(cornerRadius: 11, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            $0.titleLabel.text = "OK ~ 난 쿨하니까 허락해요!"
        }
        
        noButton.do {
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.gray02.cgColor
            $0.roundCorners(cornerRadius: 11, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            $0.titleLabel.text = "NO! 단둘이 만나는 건 자제해요!"
        }

        buttonStackView.do {
            $0.axis = .vertical
            $0.spacing = 16
        }
        
        nextButton.do {
            $0.setButton(title: "다음", backgroundColor: .gray03)
        }
        
        
    }
    
}

