//
//  AvailableTimeViewController.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/19/24.
//

import UIKit

import Then
import SnapKit

final class AvailableTimeViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let availableTimeView: AvailableTimeView = AvailableTimeView()
    
    // MARK: - Properties
    
    var timeData = AvailableTime.allHours
    
    var selectedTimeCell: Set<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        registerCell()
        setDelegate()
        setActions()
        updateNextButtonState()
    }
    
    func setHierarchy() {
        self.view.addSubview(availableTimeView)
    }
    
    
    func setLayout() {
        availableTimeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
    }
    
    func setStyle() {
        availableTimeView.availableTimeCollectionView.allowsMultipleSelection = true
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func registerCell() {
        availableTimeView.availableTimeCollectionView.register(SelectButtonCollectionViewCell.self, forCellWithReuseIdentifier: SelectButtonCollectionViewCell.cellIdentifier)
    }
    
    func setDelegate() {
        availableTimeView.availableTimeCollectionView.delegate = self
        availableTimeView.availableTimeCollectionView.dataSource = self
    }
    
    func setActions() {
        availableTimeView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        availableTimeView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
}

extension AvailableTimeViewController {
    
    @objc
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func nextButtonDidTap() {
        let dressInfoViewController = DressInfoViewController()
        self.navigationController?.pushViewController(dressInfoViewController, animated: true)
    }
    
    func updateNextButtonState() {
        let isTimeSelected = !selectedTimeCell.isEmpty
        availableTimeView.nextButton.backgroundColor = isTimeSelected ? .mainCoral : .gray03
        availableTimeView.nextButton.isEnabled = isTimeSelected
    }
    
}

extension AvailableTimeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth: CGFloat = (ScreenUtils.width - 28 - 32) / 3
        let cellHeight: CGFloat = 43
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
}


extension AvailableTimeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return timeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectButtonCollectionViewCell.cellIdentifier, for: indexPath) as? SelectButtonCollectionViewCell else { return UICollectionViewCell() }
        
        let time = timeData[indexPath.item]
        
        cell.configure(time: time)
        cell.updateSelectionState(false)
        return cell
    }
    
    // 선택된 셀 추가
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SelectButtonCollectionViewCell else { return }
        selectedTimeCell.insert(indexPath.item)
        cell.updateSelectionState(true)
        updateNextButtonState()
    }
            
    // 선택 해제된 셀 제거
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SelectButtonCollectionViewCell else { return }
        selectedTimeCell.remove(indexPath.item)
        cell.updateSelectionState(false)
        updateNextButtonState()
    }
}


