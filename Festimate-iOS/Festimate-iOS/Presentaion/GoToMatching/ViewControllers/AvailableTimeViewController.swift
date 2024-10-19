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
