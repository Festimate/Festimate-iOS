//
//  IdealTypeInputStep1ViewController.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/14/24.
//

import UIKit

import Then
import SnapKit

final class IdealTypeInputStep1ViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let idealTypeInputStep1View: IdealTypeInputStep1View = IdealTypeInputStep1View()
    
    // MARK: - Properties
    
    var mbtiData = MBTIType.mbtiData
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        registerCell()
        setDelegate()
        setActions()
    }
    
    func setHierarchy() {
        self.view.addSubview(idealTypeInputStep1View)
    }
    
    
    func setLayout() {
        idealTypeInputStep1View.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func registerCell() {
        idealTypeInputStep1View.mbtiCollectionView.register(SelectButtonCollectionViewCell.self, forCellWithReuseIdentifier: SelectButtonCollectionViewCell.cellIdentifier)
    }
    
    func setDelegate() {
        idealTypeInputStep1View.mbtiCollectionView.delegate = self
        idealTypeInputStep1View.mbtiCollectionView.dataSource = self
    }
    
    func setActions() {
  
    }
}

extension IdealTypeInputStep1ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth: CGFloat = (ScreenUtils.width - 13 - 32) / 2
        let cellHeight: CGFloat = 50
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
}


extension IdealTypeInputStep1ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return mbtiData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectButtonCollectionViewCell.cellIdentifier, for: indexPath) as? SelectButtonCollectionViewCell else { return UICollectionViewCell() }
        
        let time = mbtiData[indexPath.item]
        
        cell.configure(time: time)
        cell.updateSelectionState(false)
        return cell
    }
}

