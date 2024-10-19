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
    
    var timeData = AvailableTimeModel.allHours
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        registerCell()
        setDelegate()
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
        availableTimeView.availableTimeCollectionView.register(timeCollectionViewCell.self, forCellWithReuseIdentifier: timeCollectionViewCell.cellIdentifier)
    }
    
    func setDelegate() {
        availableTimeView.availableTimeCollectionView.delegate = self
        availableTimeView.availableTimeCollectionView.dataSource = self
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: timeCollectionViewCell.cellIdentifier, for: indexPath) as? timeCollectionViewCell else { return UICollectionViewCell() }
        
        let time = timeData[indexPath.item]
        
        cell.configure(time: time)
        cell.updateSelectionState(false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? timeCollectionViewCell else { return }
        cell.updateSelectionState(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? timeCollectionViewCell else { return }
        cell.updateSelectionState(false)
    }
}


