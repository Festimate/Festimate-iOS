//
//  CardView.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/10/24.
//

import UIKit

import SnapKit
import Then

class CardView: UIView {
    
    // MARK: - UI Properties
    
    let matchingCardCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal  

        return collectionView
    }()
    
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
        addSubview(matchingCardCollectionView)
    }
    
    func setLayout() {
        matchingCardCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    func setStyle() {
        matchingCardCollectionView.backgroundColor = .gray01
        matchingCardCollectionView.showsHorizontalScrollIndicator = false
    }
    
}

