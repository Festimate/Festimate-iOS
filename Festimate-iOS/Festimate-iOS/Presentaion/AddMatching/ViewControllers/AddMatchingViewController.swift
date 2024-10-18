//
//  AddMatchingViewController.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/12/24.
//

import UIKit

import Then
import SnapKit

final class AddMatchingViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let addMatchingView: AddMatchingView = AddMatchingView()
    
    // MARK: - Properties
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
    }
    
    func setHierarchy() {
        self.view.addSubview(addMatchingView)
    }

    
    func setLayout() {
        addMatchingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
