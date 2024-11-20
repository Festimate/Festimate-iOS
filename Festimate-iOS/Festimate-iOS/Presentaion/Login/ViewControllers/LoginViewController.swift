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
    
    // MARK: - UI Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setHierarchy()
        setLayout()
        setStyle()
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
}


