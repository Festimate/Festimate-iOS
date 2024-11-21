//
//  RegisterViewController.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit

class RegisterViewController: UIViewController {

    private let registerView = RegisterView()
    // MARK: - UI Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setHierarchy()
        setLayout()
        setStyle()
        
    }

    func setHierarchy() {
        self.view.addSubview(registerView)
    }
    
    func setLayout() {
        registerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = .mainCoral
        self.navigationItem.hidesBackButton = true
    }
}
