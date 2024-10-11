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
    
    let emptyView: EmptyView = EmptyView()
    
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
        addSubviews(matchingCardCollectionView, emptyView)
    }
    
    func setLayout() {
        matchingCardCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        emptyView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    func setStyle() {
        matchingCardCollectionView.backgroundColor = .gray01
        matchingCardCollectionView.showsHorizontalScrollIndicator = false
        
        emptyView.isHidden = true
    }
    
}

