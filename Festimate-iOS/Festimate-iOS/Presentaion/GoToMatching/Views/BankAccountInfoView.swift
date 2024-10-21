//
//  BankAccountInfoView.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/19/24.
//

import UIKit

import SnapKit
import Then

class BankAccountInfoView: UIView {
    
    // MARK: - UI Properties
    
    private let characterImageView: UIImageView = UIImageView(image: .loadingCharacter)
    
    private let titleLabel: UILabel = UILabel()
    
    private let subLabel: UILabel = UILabel()
    
    private let grayBoxView: UIView = UIView()
    
    private let bankLogoImage: UIImageView = UIImageView(image: .bankLogo)
    
    let bankInfoLabel: UILabel = UILabel()
    
    private let bankInfoStackView: UIStackView = UIStackView()
    
    let copyButton: UIButton = UIButton()
    
    private let lineView: UIView = UIView()
    
    private let timeImageView: UIImageView = UIImageView(image: .dress)

    let backToMainButton: UIButton = UIButton()
    
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
        bankInfoStackView.addArrangedSubviews(bankLogoImage, bankInfoLabel)
        
        self.addSubviews(
            characterImageView,
            titleLabel,
            subLabel,
            grayBoxView,
            bankInfoStackView,
            copyButton,
            lineView,
            backToMainButton
        )
    }
    
    func setLayout() {
        characterImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(95)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(114)
            $0.height.equalTo(117)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(characterImageView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
        
        grayBoxView.snp.makeConstraints {
            $0.top.equalTo(subLabel.snp.bottom).offset(33)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(72)
        }
        
        bankLogoImage.snp.makeConstraints {
            $0.size.equalTo(27)
        }
        
        bankInfoStackView.snp.makeConstraints {
            $0.center.equalTo(grayBoxView)
        }
        
        copyButton.snp.makeConstraints {
            $0.top.equalTo(grayBoxView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(122)
            $0.height.equalTo(21)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.equalTo(copyButton).offset(2)
            $0.horizontalEdges.equalTo(copyButton)
            $0.height.equalTo(1)
        }
        
        backToMainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(38)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    }
    
    func setStyle() {
        self.backgroundColor = .white
       
        titleLabel.do {
            $0.setLabel(text: "매칭 신청이 완료되었어요!", textColor: .gray06, font: .pretendard(.title_bold_20))
        }
        
        subLabel.do {
            $0.setLabel(text: "다음 계좌로 입금이 확인되면,\n매칭을 시작해드릴게요!", textColor: .gray05, font: .pretendard(.body_semi_15))
        }
        
        grayBoxView.do {
            $0.backgroundColor = .gray01
            $0.layer.cornerRadius = 9
        }
        
        bankLogoImage.do {
            $0.layer.cornerRadius = 13
            $0.layer.masksToBounds = true
        }
        
        bankInfoLabel.do {
            $0.setLabel(text: "카카오뱅크 3333-18-8915010", textColor: .gray06, font: .pretendard(.body_med_15))
        }
        
        bankInfoStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 7
        }
        
        copyButton.do {
            $0.setButton(title: "계좌번호 복사하기",backgroundColor: .clear, titleColor: .gray04, font: .pretendard(.body_med_13))
            $0.setImage(UIImage(resource: .copyIcon), for: .normal)
            $0.adjustsImageWhenHighlighted = false
            $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        }
        
        lineView.do {
            $0.backgroundColor = .gray04
        }
        
        backToMainButton.do {
            $0.setButton(title: "홈 화면으로 돌아가기", backgroundColor: .mainCoral)
        }
    }
    
}


