//
//  timeCollectionViewCell.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/19/24.
//

import UIKit

import Then
import SnapKit

final class timeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    private let grayBoxView = UIView()
    
    private let timeLabel = UILabel()
    
    
    // MARK: - Properties
    
    var itemRow: Int?
    
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
        self.addSubviews(grayBoxView, timeLabel)
    }
    
    func setLayout() {
        grayBoxView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints {
            $0.center.equalTo(grayBoxView)
        }
    }
    
    func setStyle() {
        grayBoxView.do {
            $0.roundCorners(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            $0.backgroundColor = .gray01
        }
        
        timeLabel.do {
            $0.setLabel(text: "10:00", textColor: .gray04, font: .pretendard(.body_med_15))
        }
    }
    
}
