//
//  matchingCardCollectionViewCell.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/4/24.
//

import UIKit

import SnapKit
import Then


final class matchingCardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    private let ticketImageView: UIImageView = UIImageView(image: .ticketWithLine)
    
    private let locationIcon: UIImageView = UIImageView(image: .locationIcon)
    
    private let locationLabel: UILabel = UILabel()
    
    private let locationInfoLabel: UILabel = UILabel()
    
    private let timeIcon: UIImageView = UIImageView(image: .timeIcon)
    
    private let timeLabel: UILabel = UILabel()
    
    private let timeInfoLabel: UILabel = UILabel()
    
    private let nickNameLabel: UILabel = UILabel()
    
    private let matchingStateButton: UIButton = UIButton()
    
    private let schoolIcon: UIImageView = UIImageView(image: .schoolIcon)
    
    private let schoolInfoLabel: UILabel = UILabel()
    
    private let ageTagLabel: UILabel = UILabel()
    
    private let mbtiTagLabel: UILabel = UILabel()
    
    private let faceTagLabel1: UILabel = UILabel()
    
    private let faceTagLabel2: UILabel = UILabel()
    
    private let dressInfoTagLabel: UILabel = UILabel()
    
    private let dressInfoBG: UIImageView = UIImageView(image: .speechBubble)
 
    let blurCardView: BlurCardView = BlurCardView()
    
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
        self.addSubviews(
            ticketImageView,
            locationIcon,
            locationLabel,
            locationInfoLabel,
            timeIcon,
            timeLabel,
            timeInfoLabel,
            nickNameLabel,
            matchingStateButton,
            schoolIcon,
            schoolInfoLabel,
            ageTagLabel,
            mbtiTagLabel,
            faceTagLabel1,
            faceTagLabel2,
            dressInfoBG,
            dressInfoTagLabel,
            blurCardView
        )
    }
    
    func setLayout() {
        ticketImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        locationIcon.snp.makeConstraints {
            $0.top.equalTo(ticketImageView).inset(ScreenUtils.height * 0.035)
            $0.leading.equalToSuperview().inset(17)
            $0.width.equalTo(14)
            $0.height.equalTo(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.centerY.equalTo(locationIcon)
            $0.leading.equalTo(locationIcon.snp.trailing).offset(11)
        }
        
        locationInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(locationIcon)
            $0.leading.equalTo(locationLabel.snp.trailing).offset(14)
        }
        
        timeIcon.snp.makeConstraints {
            $0.centerX.equalTo(locationIcon)
            $0.top.equalTo(locationIcon.snp.bottom).offset(17)
            $0.size.equalTo(14)
        }
        
        timeLabel.snp.makeConstraints {
            $0.centerY.equalTo(timeIcon)
            $0.leading.equalTo(timeIcon.snp.trailing).offset(11)
        }
        
        timeInfoLabel.snp.makeConstraints {
            $0.centerY.equalTo(timeIcon)
            $0.leading.equalTo(timeLabel.snp.trailing).offset(14)
        }
        
        nickNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(118)
            $0.leading.equalToSuperview().inset(17)
        }
        
        schoolIcon.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(9)
            $0.leading.equalTo(nickNameLabel)
            $0.width.equalTo(16)
            $0.height.equalTo(13.5)
        }
        
        schoolInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(schoolIcon.snp.trailing).offset(7)
            $0.centerY.equalTo(schoolIcon)
        }
        
        matchingStateButton.snp.makeConstraints {
            $0.centerY.equalTo(nickNameLabel)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(66)
            $0.height.equalTo(26)
        }
        
        ageTagLabel.snp.makeConstraints {
            $0.top.equalTo(schoolInfoLabel.snp.bottom).offset(11)
            $0.leading.equalTo(nickNameLabel)
        }
        
        mbtiTagLabel.snp.makeConstraints {
            $0.bottom.equalTo(ageTagLabel)
            $0.leading.equalTo(ageTagLabel.snp.trailing).offset(11)
        }
        
        faceTagLabel1.snp.makeConstraints {
            $0.top.equalTo(ageTagLabel.snp.bottom).offset(6)
            $0.leading.equalTo(nickNameLabel)
        }
        
        faceTagLabel2.snp.makeConstraints {
            $0.bottom.equalTo(faceTagLabel1)
            $0.leading.equalTo(faceTagLabel1.snp.trailing).offset(11)
        }
        
        dressInfoBG.snp.makeConstraints {
            $0.top.equalTo(faceTagLabel1.snp.bottom).offset(6)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(ScreenUtils.height * 0.12)
        }
        
        dressInfoTagLabel.snp.makeConstraints {
            $0.top.equalTo(dressInfoBG).inset(28)
            $0.leading.equalTo(dressInfoBG).inset(12)
        }
        
        blurCardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func setStyle() {
        locationLabel.do {
            $0.setLabel(text: "만남 장소", textColor: .gray04, font: .pretendard(.body_semi_15))
        }
        
        locationInfoLabel.do {
            $0.setLabel(textColor: .mainCoral, font: .pretendard(.body_semi_15))
        }
        
        timeLabel.do {
            $0.setLabel(text: "약속 시간", textColor: .gray04, font: .pretendard(.body_semi_15))
        }
        
        timeInfoLabel.do {
            $0.setLabel(textColor: .mainCoral, font: .pretendard(.body_semi_15))
        }
        
        nickNameLabel.do {
            $0.setLabel(textColor: .mainCoral, font: .pretendard(.title_extra_24))
        }
        
        matchingStateButton.do {
            $0.setButton(
                title: "매칭 완료",
                backgroundColor: .subCoral,
                titleColor: .mainCoral,
                font: .pretendard(.cap_bold_11),
                cornerRadius: 14
            )
        }
        
        schoolInfoLabel.do {
            $0.setLabel(text: "뫄뫄대학교", textColor: .gray04, font: .pretendard(.body_semi_15))
        }
        
        ageTagLabel.do {
            $0.setLabel(text: "#25세", textColor: .gray06, font: .pretendard(.body_semi_15))
        }
        
        mbtiTagLabel.do {
            $0.setLabel(text: "#ESFJ", textColor: .gray06, font: .pretendard(.body_semi_15))
        }
        
        faceTagLabel1.do {
            $0.setLabel(text: "#강아지상", textColor: .gray06, font: .pretendard(.body_semi_15))
        }
        
        faceTagLabel2.do {
            $0.setLabel(text: "#두부상", textColor: .gray06, font: .pretendard(.body_semi_15))
        }
        
        dressInfoTagLabel.do {
            $0.setLabel(textColor: .gray06, font: .pretendard(.body_med_13))
        }
        blurCardView.isHidden = true
    }
    
}


extension matchingCardCollectionViewCell {
    
    func dataBind(_ matchingData: MainModel, itemRow: Int) {
        locationInfoLabel.text = matchingData.location
        timeInfoLabel.text = matchingData.time
        nickNameLabel.text = matchingData.nickname
        schoolInfoLabel.text = matchingData.school
        ageTagLabel.text = "#\(matchingData.age)세"
        mbtiTagLabel.text = "#\(matchingData.mbti)"
        faceTagLabel1.text = "#\(matchingData.faceInfo1)"
        faceTagLabel2.text = "#\(matchingData.faceInfo2)"
        dressInfoTagLabel.text = matchingData.dressInfo
    }
}

