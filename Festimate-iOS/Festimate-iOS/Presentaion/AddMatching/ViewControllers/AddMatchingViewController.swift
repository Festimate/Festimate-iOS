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
    
    private var matchingInputData: AddMatchingModel = AddMatchingModel.sampleData() {
        didSet {
            updateButtonState()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        updateButtonState()
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

private extension AddMatchingViewController {
    
    func updateButtonState() {
        let isEnabled = matchingInputData.isIdealTypeInput && matchingInputData.isPreferenceInput
        setMatchingButtonEnabled(isEnabled)
    }
    
    func setMatchingButtonEnabled(_ isEnabled: Bool) {
        addMatchingView.matchingButton.backgroundColor = isEnabled ? .mainCoral : .gray03
        addMatchingView.matchingButton.isEnabled = isEnabled
    }
    
}
