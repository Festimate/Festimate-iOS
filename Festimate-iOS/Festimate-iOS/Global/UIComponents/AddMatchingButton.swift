//
//  AddMatchingButton.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/13/24.
//

import UIKit

import SnapKit
import Then

class AddMatchingButton: UIView {
    
    // MARK: - UI Properties
    
    private let backgroundView: UIView = UIView()
    
    var titleLabel: UILabel = UILabel()
    
    let subTitleLabel: UILabel = UILabel()
    
    private let textStackView: UIStackView = UIStackView()
    
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
        textStackView.addArrangedSubviews(titleLabel, subTitleLabel)
        
        self.addSubview(textStackView)
    }
    
    func setLayout() {
        textStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func setStyle() {
        
        titleLabel.do {
            $0.setLabel(text: "이상형", textColor: .gray06, font: .pretendard(.title_bold_18))
        }
        
        subTitleLabel.do {
            $0.setLabel(text: "나는 이런 사람과 매칭되고 싶어요!", textColor: .gray04, font: .pretendard(.body_med_13))
        }
        
        textStackView.do {
            $0.axis = .vertical
            $0.spacing = 3
        }
    }
    
}

