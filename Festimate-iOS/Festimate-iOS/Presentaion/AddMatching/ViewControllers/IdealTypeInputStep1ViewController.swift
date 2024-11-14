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
    
    var selectedMBTI: [String: String] = [:]
    
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

extension IdealTypeInputStep1ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let type = MBTIType(rawValue: mbtiData[indexPath.item]) else { return }
        
        let group = type.getGroup()
        
        if selectedMBTI[group] == type.rawValue {
            selectedMBTI[group] = nil
        } else {
            selectedMBTI[group] = type.rawValue
        }
        
        print("Current selected MBTI:", selectedMBTI)
        
        collectionView.reloadData()
    }
}

extension IdealTypeInputStep1ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return mbtiData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectButtonCollectionViewCell.cellIdentifier, for: indexPath) as? SelectButtonCollectionViewCell else { return UICollectionViewCell() }
        
        let typeString = mbtiData[indexPath.item]
        guard let type = MBTIType(rawValue: typeString) else { return UICollectionViewCell() }
        
        let group = type.getGroup() // getGroup을 직접 호출
        let isSelected = selectedMBTI[group] == type.rawValue
        
        cell.configure(time: typeString)
        cell.updateSelectionState(isSelected)
        
        return cell
    }
    
}

