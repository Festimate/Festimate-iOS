//
//  SecondUserInfoView.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit

import SnapKit
import Then

class SecondUserInfoView: UIView {
    
    private let heightLabel = UILabel()
    
    let heightTextField = FestimateTextField(placeHolder: "키를 입력해주세요")
    
    private let centimeterLabel = UILabel()
    
    private let mbtiLabel = UILabel()
    
    private let mbtiStackView = UIStackView()
    
    var buttons: [String: UIButton] = [:]
    
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
        addSubviews(heightLabel, heightTextField, centimeterLabel, mbtiLabel, mbtiStackView)
    }
    
    func setLayout() {
        heightLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        heightTextField.snp.makeConstraints {
            $0.top.equalTo(heightLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(145)
            $0.height.equalTo(50)
        }
        
        centimeterLabel.snp.makeConstraints {
            $0.centerY.equalTo(heightTextField)
            $0.leading.equalTo(heightTextField.snp.trailing).offset(9)
        }
        
        mbtiLabel.snp.makeConstraints {
            $0.top.equalTo(heightTextField.snp.bottom).offset(22)
            $0.leading.equalToSuperview().inset(16)
        }
        
        mbtiStackView.snp.makeConstraints {
            $0.top.equalTo(mbtiLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(242)
        }
    }
    
    func setStyle() {
        heightLabel.do {
            $0.setLabel(text: "키 *", textColor: .gray06, font: .pretendard(.body_semi_17))
            $0.setColorForText("*", with: .mainCoral)
        }
        
        heightTextField.do {
            $0.font = .pretendard(.body_med_15)
        }
        
        centimeterLabel.do {
            $0.setLabel(text: "cm", textColor: .gray06, font: .pretendard(.body_semi_17))
        }
        
        mbtiLabel.do {
            $0.setLabel(text: "MBTI *", textColor: .gray06, font: .pretendard(.body_semi_17))
            $0.setColorForText("*", with: .mainCoral)
        }
        
        mbtiStackView.do {
            $0.axis = .vertical
            $0.spacing = 14
            $0.distribution = .fillEqually
        }
        
        let mbtiTypes = [["E", "I"], ["N", "S" ], ["F", "T"], ["P", "J"]]
        
        for row in mbtiTypes {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 13
            rowStackView.distribution = .fillEqually
            
            for type in row {
                buttons[type] = createMBTIButton(title: type)
                rowStackView.addArrangedSubview(buttons[type]!)
            }
            
            mbtiStackView.addArrangedSubview(rowStackView)
        }
    }
    
    private func createMBTIButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.gray04, for: .normal)
        button.backgroundColor = .gray01
        button.layer.cornerRadius = 8
        return button
    }
}
