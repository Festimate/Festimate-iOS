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
    
    let addMatchingView: AddMatchingView = AddMatchingView()
    
    // MARK: - Properties
    
    private var matchingInputData: AddMatchingModel = AddMatchingModel.sampleData() {
        didSet {
            updateButtonState()
        }
    }
    
    private var isMatchingEnabled: Bool {
        return matchingInputData.isIdealTypeInput && matchingInputData.isPreferenceInput
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        updateButtonState()
        setActions()
    }
    
    func setHierarchy() {
        self.view.addSubview(addMatchingView)
    }
    
    
    func setLayout() {
        addMatchingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setActions() {
        addMatchingView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        addMatchingView.matchingButton.addTarget(self, action: #selector(matchingButtonDidTap), for: .touchUpInside)
    }
}

private extension AddMatchingViewController {
    
    @objc
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func matchingButtonDidTap() {
        if isMatchingEnabled {
            let availableTimeViewController = AvailableTimeViewController()
            self.navigationController?.pushViewController(availableTimeViewController, animated: true)
        }
    }
    
    func updateButtonState() {
        setButtonState(isIdealTypeInput: matchingInputData.isIdealTypeInput, isPreferenceInput: matchingInputData.isPreferenceInput)
        setMatchingButtonEnabled(isMatchingEnabled)
    }
    
    func setMatchingButtonEnabled(_ isEnabled: Bool) {
        addMatchingView.matchingButton.backgroundColor = isEnabled ? .mainCoral : .gray03
        addMatchingView.matchingButton.isEnabled = isEnabled
    }
    
    func setButtonState(isIdealTypeInput: Bool, isPreferenceInput: Bool) {
        if isIdealTypeInput {
            activeButton(addMatchingView.idealTypeButton)
        }
        
        if isPreferenceInput {
            activeButton(addMatchingView.preferenceButton)
        }
    }
    
    func activeButton(_ button: UIView) {
        button.backgroundColor = .subCoral
        button.layer.borderColor = UIColor.mainCoral.cgColor
    }
    
}
