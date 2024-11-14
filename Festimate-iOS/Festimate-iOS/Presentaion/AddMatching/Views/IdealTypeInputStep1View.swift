//
//  IdealTypeInputStep1View.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/14/24.
//

import UIKit

import SnapKit
import Then

class IdealTypeInputStep1View: UIView {
    
    // MARK: - UI Properties
    private let numLabel: UILabel = UILabel()
    
    private let titleLabel: UILabel = UILabel()

    private let ageLabel: UILabel = UILabel()
    
    private let minAgeTextField: UITextField = UITextField()
    
    private let maxAgeTextField: UITextField = UITextField()
    
    private let ageRangeLine: UIView = UIView()
    
    private let yearsLabel: UILabel = UILabel()
    
    private let heightLabel: UILabel = UILabel()
    
    private let minHeightTextField: UITextField = UITextField()
    
    private let maxHeightTextField: UITextField = UITextField()
    
    private let heightRangeLine: UIView = UIView()
    
    private let cmLabel: UILabel = UILabel()
    
    private let mbtiLabel: UILabel = UILabel()
    
    let mbtiCollectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let nextButton: UIButton = UIButton()
    
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
        addSubviews(numLabel, titleLabel, ageLabel, minAgeTextField, maxAgeTextField, ageRangeLine, yearsLabel, heightLabel, minHeightTextField, maxHeightTextField, heightRangeLine, cmLabel, mbtiLabel, mbtiCollectionView, nextButton)
    }
    
    func setLayout() {
        numLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(31)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(numLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }
        
        ageLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        minAgeTextField.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.bottom).offset(10)
            $0.leading.equalTo(ageLabel)
            $0.width.equalTo(125)
            $0.height.equalTo(50)
        }
        
        ageRangeLine.snp.makeConstraints {
            $0.centerY.equalTo(minAgeTextField)
            $0.leading.equalTo(minAgeTextField.snp.trailing).offset(8)
            $0.width.equalTo(10)
            $0.height.equalTo(2)
        }
        
        maxAgeTextField.snp.makeConstraints {
            $0.top.equalTo(minAgeTextField)
            $0.leading.equalTo(ageRangeLine.snp.trailing).offset(10)
            $0.height.equalTo(50)
            $0.width.equalTo(125)
        }
        
        yearsLabel.snp.makeConstraints {
            $0.centerY.equalTo(maxAgeTextField)
            $0.leading.equalTo(maxAgeTextField.snp.trailing).offset(10)
        }
        
        heightLabel.snp.makeConstraints {
            $0.top.equalTo(minAgeTextField.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(16)
        }
        
        minHeightTextField.snp.makeConstraints {
            $0.top.equalTo(heightLabel.snp.bottom).offset(10)
            $0.leading.equalTo(heightLabel)
            $0.width.equalTo(125)
            $0.height.equalTo(50)
        }
        
        heightRangeLine.snp.makeConstraints {
            $0.centerY.equalTo(minHeightTextField)
            $0.leading.equalTo(minHeightTextField.snp.trailing).offset(8)
            $0.width.equalTo(10)
            $0.height.equalTo(2)
        }
        
        maxHeightTextField.snp.makeConstraints {
            $0.top.equalTo(minHeightTextField)
            $0.leading.equalTo(heightRangeLine.snp.trailing).offset(10)
            $0.height.equalTo(50)
            $0.width.equalTo(125)
        }
        
        cmLabel.snp.makeConstraints {
            $0.centerY.equalTo(maxHeightTextField)
            $0.leading.equalTo(maxHeightTextField.snp.trailing).offset(10)
        }
        
        mbtiLabel.snp.makeConstraints {
            $0.top.equalTo(minHeightTextField.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(16)
        }
        
        mbtiCollectionView.snp.makeConstraints {
            $0.top.equalTo(mbtiLabel.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(242)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(38)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
    }
    
    func setStyle() {
        self.backgroundColor = .white
        
        numLabel.do {
            $0.setLabel(text: "1",textColor: .fmWhite, font: .pretendard(.body_bold_15))
            $0.backgroundColor = .mainCoral
            $0.layer.cornerRadius = 16
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.setLabel(text: "내 이상형 정보 입력", textColor: .gray06, font: .pretendard(.title_bold_20))
        }
        
        ageLabel.do {
            $0.setLabel(text: "나이 *", textColor: .gray06, font: .pretendard(.body_semi_17))
            $0.setColorForText("*", with: .mainCoral)
        }
        
        minAgeTextField.do {
            $0.setStyle(placeholder: "최소")
            $0.keyboardType = .numberPad 
        }
        
        ageRangeLine.backgroundColor = .gray06
        
        maxAgeTextField.do {
            $0.setStyle(placeholder: "최대")
            $0.keyboardType = .numberPad
        }
        
        yearsLabel.do {
            $0.setLabel(text: "세", textColor: .gray06, font: .pretendard(.body_semi_17))
        }
        
        heightLabel.do {
            $0.setLabel(text: "키 *", textColor: .gray06, font: .pretendard(.body_semi_17))
            $0.setColorForText("*", with: .mainCoral)
        }
        
        minHeightTextField.do {
            $0.setStyle(placeholder: "최소")
            $0.keyboardType = .numberPad
        }
        
        heightRangeLine.backgroundColor = .gray06
        
        maxHeightTextField.do {
            $0.setStyle(placeholder: "최대")
            $0.keyboardType = .numberPad
        }
        
        cmLabel.do {
            $0.setLabel(text: "cm", textColor: .gray06, font: .pretendard(.body_semi_17))
        }
        
        mbtiLabel.do {
            $0.setLabel(text: "MBTI *", textColor: .gray06, font: .pretendard(.body_semi_17))
            $0.setColorForText("*", with: .mainCoral)
        }
        
        nextButton.do {
            $0.setButton(title: "다음")
        }
    }
    
}
