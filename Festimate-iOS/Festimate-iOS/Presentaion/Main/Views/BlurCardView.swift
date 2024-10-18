//
//  BlurCardView.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/10/24.
//

import UIKit

import SnapKit
import Then

class BlurCardView: UIView {
    
    // MARK: - UI Properties
    
    private let blurTicketView: UIImageView = UIImageView(image: .ticketWithBlur)

    private let characterImageView: UIImageView = UIImageView(image: .loadingCharacter)
    
    private let matchingLabel: UILabel = UILabel()
        
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
        addSubviews(blurTicketView, characterImageView, matchingLabel)
    }
    
    func setLayout() {
        blurTicketView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        characterImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(61)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(114)
            $0.height.equalTo(127)
        }
        
        matchingLabel.snp.makeConstraints {
            $0.top.equalTo(characterImageView.snp.bottom).offset(39)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    func setStyle() {
        matchingLabel.do {
            $0.setLabel(text: "이상형 조건에 맞는 MATE를\n찾는 중이니 조금만 기다려주세요!", textColor: .gray06, font: .pretendard(.body_med_15))
        }
    }
    
}

