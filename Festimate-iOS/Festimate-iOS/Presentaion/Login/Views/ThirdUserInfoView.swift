//
//  ThirdUserInfoView.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit

import SnapKit
import Then

class ThirdUserInfoView: UIView {
    
    private let infoIcon = UIImageView(image: .infoIcon)
    
    private let infoLabel = UILabel()
    
    private let infoStackView = UIStackView()
    
    private let faceStackView = UIStackView()
    
    var buttons : [String: UIButton] = [:]
    
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
        addSubviews(infoStackView, faceStackView)
        infoStackView.addArrangedSubviews(infoIcon, infoLabel)
    }
    
    func setLayout() {
        infoStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(9)
        }
        
        faceStackView.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.bottom).offset(34)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(403)
        }
    }
    
    func setStyle() {
        infoStackView.do {
            $0.axis = .horizontal
            $0.spacing = 7
        }
        
        infoLabel.do {
            $0.setLabel(text: "최대 2개까지 선택 가능해요", textColor: .gray04, font: .pretendard(.body_med_13))
        }
        
        faceStackView.do {
            $0.axis = .vertical
            $0.spacing = 17
            $0.distribution = .fillEqually
        }
        
        let faceTypes = [["고양이상","강아지상"],["공룡상","여우상"],["곰상","토끼상"],["아랍상","두부상"]]
        
        for row in faceTypes {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 13
            rowStackView.distribution = .fillEqually
            
            for type in row {
                buttons[type] = createFaceTypeButton(title: type)
                rowStackView.addArrangedSubview(buttons[type]!)
            }
            
            faceStackView.addArrangedSubview(rowStackView)
        }
    }
    
    private func createFaceTypeButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.gray04, for: .normal)
        button.backgroundColor = .gray01
        button.layer.cornerRadius = 8
        return button
    }
}
