//
//  BankAccountInfoViewController.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/19/24.
//

import UIKit

import Then
import SnapKit

final class BankAccountInfoViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let bankAccountInfoView: BankAccountInfoView = BankAccountInfoView()
    
    // MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setActions()
        updateNextButtonState()
    }
    
    func setHierarchy() {
        self.view.addSubview(bankAccountInfoView)
    }
    
    
    func setLayout() {
        bankAccountInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func setActions() {
//        bankAccountInfoView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
//        bankAccountInfoView.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
}

extension BankAccountInfoViewController {
    
    @objc
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func nextButtonDidTap() {
        let bankAccountInfoViewController = BankAccountInfoViewController()
        self.navigationController?.pushViewController(bankAccountInfoViewController, animated: true)
    }
    
    func updateNextButtonState() {

    }
    
}


