//
//  RegisterViewController.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit
import Combine

import SnapKit
import Then

class RegisterViewController: UIViewController {
    
    private let registerViewModel = RegisterViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var registerView = RegisterView()
    
    lazy var firstUserInfoViewController = FirstUserInfoViewController()
    
    lazy var secondUserInfoViewController = SecondUserInfoViewController()
    
    lazy var thirdUserInfoViewController = ThirdUserInfoViewController()
    
    lazy var userInfoViewControllers = [firstUserInfoViewController, secondUserInfoViewController, thirdUserInfoViewController]
    
    private var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setPageViewController()
        setStyle()
        setupDelegate()
        disableScroll()
        receiveState()
        receiveSideEffect()
        addTargets()
    }
    
    func setHierarchy() {
        self.view.addSubview(registerView)
        registerView.containerView.addSubview(pageViewController.view)
    }
    
    func setLayout() {
        registerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
    }
    
    func setPageViewController() {
        if let firstVC = userInfoViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        pageViewController.didMove(toParent: self)
    }
    
    func setStyle() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupDelegate() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
    
    private func disableScroll() {
        pageViewController.view.subviews.forEach { subview in
            if let scrollView = subview as? UIScrollView {
                scrollView.isScrollEnabled = false
            }
        }
    }
    
    private func addTargets() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonDidTap))
        registerView.backButton.addGestureRecognizer(tapGesture)
        registerView.registerButton.addTarget(self, action: #selector(registerButtonDidTap), for: .touchUpInside)
        firstUserInfoViewController.firstUserInfoView.do {
            $0.nameTextField.addTarget(self, action: #selector(nameTextFieldDidChange(_:)), for: .editingChanged)
            $0.nicknameTextField.addTarget(self, action: #selector(nickNameTextFieldDidChange(_:)), for: .editingChanged)
            $0.ageTextField.addTarget(self, action: #selector(ageTextFieldDidChange(_:)), for: .editingChanged)
            $0.schoolTextField.addTarget(self, action: #selector(schoolTextFieldDidChange(_:)), for: .editingChanged)
            $0.womanButton.addTarget(self, action: #selector(womanButtonDidTap), for: .touchUpInside)
            $0.manButton.addTarget(self, action: #selector(manButtonDidTap), for: .touchUpInside)
            $0.nicknameValidateButton.addTarget(self, action: #selector(validateButtonDidTap), for: .touchUpInside)
        }
        
        secondUserInfoViewController.secondUserInfoView.do {
            $0.heightTextField.addTarget(self, action: #selector(heightTextFieldDidChange), for: .editingChanged)
            $0.buttons.forEach {
                $0.value.addTarget(self, action: #selector(mbtiButtonDidTap(_:)), for: .touchUpInside)
            }
        }
        
        thirdUserInfoViewController.thirdUserInfoView.do {
            $0.buttons.forEach {
                $0.value.addTarget(self, action: #selector(faceTypeButtonDidTap(_:)), for: .touchUpInside)
            }
        }
    }
}

extension RegisterViewController {
    @objc
    func backButtonDidTap() {
        registerViewModel.backbuttonTapped()
    }
    
    @objc
    func registerButtonDidTap() {
        registerViewModel.registerButtonTapped()
    }
    
    @objc
    func womanButtonDidTap() {
        registerViewModel.womanButtonTapped()
    }
    
    @objc
    func manButtonDidTap() {
        registerViewModel.manButtonTapped()
    }
    
    @objc
    func validateButtonDidTap() {
        registerViewModel.validateButtonTapped()
    }
    
    @objc
    func nameTextFieldDidChange(_ textField: UITextField) {
        registerViewModel.updateName(name: textField.text ?? "")
    }
    
    @objc
    func nickNameTextFieldDidChange(_ textField: UITextField) {
        registerViewModel.updateNickname(nickname: textField.text ?? "")
    }
    
    @objc
    func ageTextFieldDidChange(_ textField: UITextField) {
        registerViewModel.updateAge(age: textField.text ?? "")
    }
    
    @objc
    func schoolTextFieldDidChange(_ textField: UITextField) {
        registerViewModel.updateSchool(school: textField.text ?? "")
    }
    
    @objc
    func heightTextFieldDidChange(_ textField: UITextField) {
        registerViewModel.updateHeight(height: textField.text ?? "")
    }
    
    @objc private func mbtiButtonDidTap(_ sender: UIButton) {
        guard let selectedType = sender.title(for: .normal) else { return }
        registerViewModel.mbtiButtonTapped(letter: selectedType)
    }
    
    @objc private func faceTypeButtonDidTap(_ sender: UIButton) {
        guard let selectedType = sender.title(for: .normal) else { return }
        registerViewModel.faceTypeButtonTapped(letter: selectedType)
    }
}

extension RegisterViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = userInfoViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return userInfoViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = userInfoViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == userInfoViewControllers.count {
            return nil
        }
        return userInfoViewControllers[nextIndex]
    }
}

extension RegisterViewController {
    func receiveState() {
        registerViewModel.$registerState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.render(state: state)
            }
            .store(in: &cancellables)
    }
    
    private func render(state: RegisterState) {
        switch state.currentStep {
        case .first:
            registerView.numberLabel.text = "1"
            registerView.titleLabel.text = "내 정보 입력"
        case .second:
            registerView.numberLabel.text = "2"
            registerView.titleLabel.text = "내 정보 입력"
        case .third:
            registerView.numberLabel.text = "3"
            registerView.titleLabel.text = "내 얼굴 상은?"
        }
        
        switch state.gender {
        case .unSelected:
            firstUserInfoViewController.firstUserInfoView.womanButton.do {
                $0.backgroundColor = .gray01
                $0.setTitleColor(.gray04, for: .normal)
            }
            firstUserInfoViewController.firstUserInfoView.manButton.do {
                $0.backgroundColor = .gray01
                $0.setTitleColor(.gray04, for: .normal)
            }
        case .woman:
            firstUserInfoViewController.firstUserInfoView.womanButton.do {
                $0.backgroundColor = .mainCoral
                $0.setTitleColor(.white, for: .normal)
            }
            firstUserInfoViewController.firstUserInfoView.manButton.do {
                $0.backgroundColor = .gray01
                $0.setTitleColor(.gray04, for: .normal)
            }
        case .man:
            firstUserInfoViewController.firstUserInfoView.womanButton.do {
                $0.backgroundColor = .gray01
                $0.setTitleColor(.gray04, for: .normal)
            }
            firstUserInfoViewController.firstUserInfoView.manButton.do {
                $0.backgroundColor = .mainCoral
                $0.setTitleColor(.white, for: .normal)
            }
        }
        
        firstUserInfoViewController.firstUserInfoView.do {
            $0.nameTextField.text = state.name
            $0.nicknameTextField.text = state.nickname
            $0.ageTextField.text = state.age
            $0.schoolTextField.text = state.school
            $0.nicknameErrorLabel.text = state.nicknameError
            switch state.nicknameErrorState {
            case .empty: $0.nicknameErrorLabel.textColor = .gray04
                $0.nicknameValidateButton.isEnabled = false
                $0.nicknameValidateButton.backgroundColor = .gray03
            case .notChecked: $0.nicknameErrorLabel.textColor = .gray04
                $0.nicknameValidateButton.isEnabled = true
                $0.nicknameValidateButton.backgroundColor = .mainCoral
            case .invalid: $0.nicknameErrorLabel.textColor = .alertRed
                $0.nicknameValidateButton.isEnabled = false
                $0.nicknameValidateButton.backgroundColor = .gray03
            case .valid: $0.nicknameErrorLabel.textColor = .alertBlue
                $0.nicknameValidateButton.isEnabled = false
                $0.nicknameValidateButton.backgroundColor = .mainCoral
            }
        }
        
        switch state.buttonState {
            
        case .disable:
            registerView.registerButton.do {
                $0.setTitle("다음", for: .normal)
                $0.backgroundColor = .gray03
                $0.isEnabled = false
            }
        case .enable:
            registerView.registerButton.do {
                $0.setTitle("다음", for: .normal)
                $0.backgroundColor = .mainCoral
                $0.isEnabled = true
            }
        case .complete:
            registerView.registerButton.do {
                $0.setTitle("완료", for: .normal)
                $0.backgroundColor = .mainCoral
                $0.isEnabled = true
            }
        case .uncomplete:
            registerView.registerButton.do {
                $0.setTitle("완료", for: .normal)
                $0.backgroundColor = .gray03
                $0.isEnabled = false
            }
        }
        
        for (type, button) in secondUserInfoViewController.secondUserInfoView.buttons {
            UIView.performWithoutAnimation {
                if state.selectedMBTIs.contains(type) {
                    button.backgroundColor = .mainCoral
                    button.setTitleColor(.white, for: .normal)
                } else {
                    button.backgroundColor = .gray01
                    button.setTitleColor(.gray04, for: .normal)
                }
            }
        }
        
        secondUserInfoViewController.secondUserInfoView.heightTextField.text = state.height
        
        for (type, button) in thirdUserInfoViewController.thirdUserInfoView.buttons {
            UIView.performWithoutAnimation {
                if state.selectedFaces.contains(type) {
                    button.backgroundColor = .mainCoral
                    button.setTitleColor(.white, for: .normal)
                } else {
                    button.backgroundColor = .gray01
                    button.setTitleColor(.gray04, for: .normal)
                }
            }
        }
    }
    
    func receiveSideEffect() {
        registerViewModel.sideEffect
            .receive(on: DispatchQueue.main)
            .sink { [weak self] effect in
                self?.handleSideEffect(effect)
            }
            .store(in: &cancellables)
    }
    
    private func handleSideEffect(_ effect: RegisterSideEffect) {
        switch effect {
            
        case .complete:
            break
        case .pop:
            break
        case .nextStep(step: let step):
            pageViewController.setViewControllers([userInfoViewControllers[step.rawValue]], direction: .forward, animated: true, completion: nil)
        case .previousStep(step: let step):
            pageViewController.setViewControllers([userInfoViewControllers[step.rawValue]], direction: .reverse, animated: true, completion: nil)
        }
    }
}
