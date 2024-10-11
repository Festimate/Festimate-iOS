//
//  EmptyView.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/11/24.
//

import UIKit

import SnapKit
import Then

class EmptyView: UIView {
     
     // MARK: - UI Properties
     
     private let ticketImageView: UIImageView = UIImageView(image: .ticket)
     
     private let emptyCharacterImageView: UIImageView = UIImageView(image: .emptyCharacter)
     
     private let emptyLabel: UILabel = UILabel()
     
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
          addSubviews(ticketImageView, emptyCharacterImageView, emptyLabel)
     }
     
     func setLayout() {
          
          ticketImageView.snp.makeConstraints {
               $0.horizontalEdges.equalToSuperview().inset(42)
               $0.verticalEdges.equalToSuperview()
          }
          
          emptyCharacterImageView.snp.makeConstraints {
               $0.top.equalToSuperview().inset(31)
               $0.centerX.equalToSuperview()
          }
          
          emptyLabel.snp.makeConstraints {
               $0.top.equalTo(emptyCharacterImageView.snp.bottom).offset(18)
               $0.centerX.equalToSuperview()
          }
     }
     
     
     func setStyle() {
          emptyLabel.setLabel(textColor: .gray04, font: .pretendard(.body_semi_15))
     }
     
}

