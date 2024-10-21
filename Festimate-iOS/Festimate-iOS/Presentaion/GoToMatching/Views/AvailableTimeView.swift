//
//  AvailableTimeView.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/19/24.
//

import UIKit

import SnapKit
import Then

class AvailableTimeView: UIView {
    
    // MARK: - UI Properties

    let backButton: UIButton = UIButton()
    
    private let titleLabel: UILabel = UILabel()
    
    private let timeImageView: UIImageView = UIImageView(image: .time)
    
    private let infoIcon: UIImageView = UIImageView(image: .infoIcon)
    
    private let infoLabel: UILabel = UILabel()
    
    private let setTimeLabel: UILabel = UILabel()
        
    let availableTimeCollectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        addSubviews(backButton, titleLabel, timeImageView, infoIcon, infoLabel, setTimeLabel, availableTimeCollectionView, nextButton)
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
        
        timeImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(101)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(105)
            $0.height.equalTo(125)
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
        
        setTimeLabel.snp.makeConstraints {
            $0.top.equalTo(infoIcon.snp.bottom).offset(52)
            $0.leading.equalTo(infoIcon)
        }
        
        availableTimeCollectionView.snp.makeConstraints {
            $0.top.equalTo(setTimeLabel.snp.bottom).offset(22)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(214)
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
            $0.setLabel(text: "만날 수 있는 시간을\n모두 골라주세요!", alignment: .left, textColor: .gray06, font: .pretendard(.title_bold_18))
            $0.setColorForText("시간", with: .mainCoral)
        }
        
        infoLabel.do {
            $0.setLabel(text:"다중 선택 가능", textColor: .gray04, font: .pretendard(.body_med_13))
        }
        
        setTimeLabel.do {
            $0.setLabel(text: "가능한 시간대 설정하기 *", textColor: .gray06, font: .pretendard(.body_semi_15))
            $0.setColorForText("*", with: .mainCoral)
        }
        
        nextButton.do {
            $0.setButton(title: "다음", backgroundColor: .gray03)
        }
    }
    
}


