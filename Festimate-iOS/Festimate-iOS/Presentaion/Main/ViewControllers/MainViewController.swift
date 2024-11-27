//
//  MainViewController.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/4/24.
//

import UIKit

import Then
import SnapKit

final class MainViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let mainView: MainView = MainView()
    
    // MARK: - Properties
    
    private var matchingData: [MainModel] = MainModel.dummy() {
        didSet {
            self.mainView.cardView.matchingCardCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        setDelegate()
        setHierarchy()
        setLayout()
        setActions()
        
        print()
    }
    
    func setHierarchy() {
        self.view.addSubview(mainView)
    }
    
    func registerCell() {
        mainView.cardView.matchingCardCollectionView.register(matchingCardCollectionViewCell.self, forCellWithReuseIdentifier: matchingCardCollectionViewCell.cellIdentifier)
    }
    
    func setDelegate() {
        mainView.cardView.matchingCardCollectionView.delegate = self
        mainView.cardView.matchingCardCollectionView.dataSource = self
    }
    
    func setLayout() {
        mainView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setActions() {
        mainView.addMatchingButton.addTarget(self, action: #selector(addMatchingButtonDidTap), for: .touchUpInside)
    }
}

extension MainViewController {
    
    func isCellEmpty(cellCount: Int) {
        let isEmpty = cellCount == 0
        
        self.mainView.cardView.matchingCardCollectionView.isHidden = isEmpty
        self.mainView.cardView.emptyView.isHidden = !isEmpty
    }
    
    @objc
    func addMatchingButtonDidTap() {
        let addMatchingViewController = AddMatchingViewController()
        self.navigationController?.pushViewController(addMatchingViewController, animated: true)
    }
}


extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 42, bottom: 0, right: 42)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = ScreenUtils.width * 0.77
        let screenHeight = ScreenUtils.height * 0.43
        
        return CGSize(width: screenWidth, height: screenHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
}


extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        isCellEmpty(cellCount: matchingData.count)
        
        return matchingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: matchingCardCollectionViewCell.cellIdentifier, for: indexPath) as? matchingCardCollectionViewCell else { return UICollectionViewCell() }
        cell.blurCardView.isHidden = matchingData[indexPath.item].matchingState
        cell.dataBind(matchingData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}
