//
//  ViewController.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/2/24.
//

import UIKit

import Then
import SnapKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    private let tokenManager = TokenManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setLayout()
        setStyle()
        addActions()
        
        if tokenManager.read() != nil {
            navigateToMain()
        }
    }
    
    func setHierarchy() {
        self.view.addSubview(loginView)
    }
    
    func setLayout() {
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = .mainCoral
    }
    
    func addActions() {
        loginView.kakaoLoginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        loginView.appleLoginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapLoginButton() {
        navigateToNext()
    }
    
    private func navigateToNext() {
        let nextViewController = RegisterViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func navigateToMain() {
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows
            .first?.rootViewController = navigationController
    }
}


