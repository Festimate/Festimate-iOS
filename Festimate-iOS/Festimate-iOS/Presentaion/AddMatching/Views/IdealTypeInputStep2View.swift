//
//  IdealTypeInputStep2View.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/14/24.
//

import UIKit

import SnapKit
import Then

class IdealTypeInputStep2View: UIView {
    
    // MARK: - UI Properties
    
    let backButton: UIButton = UIButton()

    private let numLabel: UILabel = UILabel()
    
    private let titleLabel: UILabel = UILabel()
    
    private let infoIcon: UIImageView = UIImageView(image: .infoIcon)
    
    private let infoLabel: UILabel = UILabel()
    
    private let infoStackView: UIStackView = UIStackView()
    
    let faceTypeCollectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        infoStackView.addArrangedSubviews(infoIcon, infoLabel)
        addSubviews(backButton, numLabel, titleLabel, infoStackView, faceTypeCollectionView, completeButton)
    }
    
    func setLayout() {
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview()
            $0.size.equalTo(44)
        }
        
        numLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(87)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(31)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(numLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }
        
        faceTypeCollectionView.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.bottom).offset(34)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(403)
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
        
        numLabel.do {
            $0.setLabel(text: "2",textColor: .fmWhite, font: .pretendard(.body_bold_15))
            $0.backgroundColor = .mainCoral
            $0.layer.cornerRadius = 16
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.setLabel(text: "내 이상형 정보 입력", textColor: .gray06, font: .pretendard(.title_bold_20))
        }
        
        infoLabel.do {
            $0.setLabel(text: "최대 2개까지 선택 가능해요", textColor: .gray04, font: .pretendard(.body_med_13))
        }
        
        infoStackView.do {
            $0.axis = .horizontal
            $0.alignment = .top
            $0.spacing = 7
        }
        
        completeButton.do {
            $0.setButton(title: "완료", backgroundColor: .gray03)
        }
    }
    
}

