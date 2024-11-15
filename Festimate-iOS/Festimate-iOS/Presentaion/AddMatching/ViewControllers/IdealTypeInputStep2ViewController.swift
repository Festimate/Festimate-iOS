//
//  IdealTypeInputStep2ViewController.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/14/24.
//

import UIKit

import Then
import SnapKit

final class IdealTypeInputStep2ViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let idealTypeInputStep2View: IdealTypeInputStep2View = IdealTypeInputStep2View()
    
    // MARK: - Properties
    
    var faceTypeData = FaceType.faceTypeData
    
    var selectedFaceTypeCell: Set<Int> = []
    
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
        self.view.addSubview(idealTypeInputStep2View)
    }
    
    
    func setLayout() {
        idealTypeInputStep2View.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        idealTypeInputStep2View.faceTypeCollectionView.allowsMultipleSelection = true
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func registerCell() {
        idealTypeInputStep2View.faceTypeCollectionView.register(SelectButtonCollectionViewCell.self, forCellWithReuseIdentifier: SelectButtonCollectionViewCell.cellIdentifier)
    }
    
    func setDelegate() {
        idealTypeInputStep2View.faceTypeCollectionView.delegate = self
        idealTypeInputStep2View.faceTypeCollectionView.dataSource = self
    }
    
    func setActions() {
        idealTypeInputStep2View.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
}

extension IdealTypeInputStep2ViewController {
    
    @objc
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateCompleteButtonState() {
        let isFaceTypeSelected = !selectedFaceTypeCell.isEmpty
        idealTypeInputStep2View.completeButton.backgroundColor = isFaceTypeSelected ? .mainCoral : .gray03
        idealTypeInputStep2View.completeButton.isEnabled = isFaceTypeSelected
    }
    
}

extension IdealTypeInputStep2ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth: CGFloat = (ScreenUtils.width - 13 - 32) / 2
        let cellHeight: CGFloat = 88
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }
}


extension IdealTypeInputStep2ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return faceTypeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectButtonCollectionViewCell.cellIdentifier, for: indexPath) as? SelectButtonCollectionViewCell else { return UICollectionViewCell() }
        
        let time = faceTypeData[indexPath.item]
        
        cell.configure(time: time)
        cell.updateSelectionState(false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard selectedFaceTypeCell.count < 2 else {
            // 이미 두 개가 선택되어 있으면, 더 이상 선택하지 못하도록 처리
            collectionView.deselectItem(at: indexPath, animated: true)
            return
        }
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? SelectButtonCollectionViewCell else { return }
        selectedFaceTypeCell.insert(indexPath.item)
        cell.updateSelectionState(true)
        updateCompleteButtonState()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SelectButtonCollectionViewCell else { return }
        selectedFaceTypeCell.remove(indexPath.item)
        cell.updateSelectionState(false)
        updateCompleteButtonState()
    }
}


