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
        
    var matchingModel: MatchingModel? {
        didSet {
            updateIdealTypeInputState()
        }
    }
    
    private var addMatchingModel: AddMatchingModel {
        return AddMatchingModel(
            isIdealTypeInput: isIdealTypeInput,
            isPreferenceInput: isPreferenceInput
        )
    }
    
    private var isIdealTypeInput: Bool = false {
        didSet {
            updateButtonState()
        }
    }
    
    private var isPreferenceInput: Bool = true
    
    private var isMatchingEnabled: Bool {
        return isIdealTypeInput && isPreferenceInput
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
        addMatchingView.idealTypeButton.isUserInteractionEnabled = true
        addMatchingView.idealTypeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.idealTypeButtonDidTap)))
        addMatchingView.matchingButton.addTarget(self, action: #selector(matchingButtonDidTap), for: .touchUpInside)
    }
}

private extension AddMatchingViewController {
    
    @objc
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func idealTypeButtonDidTap() {
        let idealTypeInputStep1ViewController = IdealTypeInputStep1ViewController()
        self.navigationController?.pushViewController(idealTypeInputStep1ViewController, animated: true)
    }
    
    @objc
    func matchingButtonDidTap() {
        if isMatchingEnabled {
            let availableTimeViewController = AvailableTimeViewController()
            availableTimeViewController.matchingModel = matchingModel
            self.navigationController?.pushViewController(availableTimeViewController, animated: true)
        }
    }
    
    func updateIdealTypeInputState() {
        if let model = matchingModel {
            isIdealTypeInput = isMatchingModelFilled(model)
        } else {
            isIdealTypeInput = false
        }
    }
    
    func isMatchingModelFilled(_ model: MatchingModel) -> Bool {
        return model.minHeight > 0 &&
        model.maxHeight > 0 &&
        model.minAge > 0 &&
        model.maxAge > 0 &&
        !model.mbti.isEmpty &&
        !model.appearanceList.isEmpty
    }
    
    
    func updateButtonState() {
        setButtonState(isIdealTypeInput: isIdealTypeInput, isPreferenceInput: isPreferenceInput)
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
