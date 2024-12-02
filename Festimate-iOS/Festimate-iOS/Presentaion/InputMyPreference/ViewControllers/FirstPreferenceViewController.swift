//
//  FirstPreferenceViewController.swift
//  Festimate-iOS
//
//  Created by 김희은 on 11/16/24.
//

import UIKit

import Then
import SnapKit

final class FirstPreferenceViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let firstPreferenceView: FirstPreferenceView = FirstPreferenceView()
    
    // MARK: - Properties
    
    private var myPreferenceInputData: MyPreferenceModel = MyPreferenceModel.sampleData() {
        didSet {
            updateButtonState()
        }
    }
    
    var isNextViewEnabled: Bool {
        return myPreferenceInputData.isOkInput && myPreferenceInputData.isNoInput
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
        self.view.addSubview(firstPreferenceView)
    }
    
    
    func setLayout() {
        firstPreferenceView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setActions() {
        firstPreferenceView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        firstPreferenceView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
}

private extension FirstPreferenceViewController {
    
    @objc
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func nextButtonDidTap() {
        if isNextViewEnabled {
            let availableTimeViewController = AvailableTimeViewController()
            self.navigationController?.pushViewController(availableTimeViewController, animated: true)
        }
    }
    
    func updateButtonState() {
        setButtonState(isOkInput: myPreferenceInputData.isOkInput, isNoInput: myPreferenceInputData.isNoInput)
        setMatchingButtonEnabled(isNextViewEnabled)
    }
    
    func setMatchingButtonEnabled(_ isEnabled: Bool) {
        firstPreferenceView.nextButton.backgroundColor = isEnabled ? .mainCoral : .gray03
        firstPreferenceView.nextButton.isEnabled = isEnabled
    }
    
    func setButtonState(isOkInput: Bool, isNoInput: Bool) {
        if isOkInput {
            activeButton(firstPreferenceView.okayButton)
        }
        
        if isNoInput {
            activeButton(firstPreferenceView.noButton)
        }
    }
    
    private func activeButton(_ button: UIView) {
        button.backgroundColor = .subCoral
        button.layer.borderColor = UIColor.mainCoral.cgColor
    }
    
}
