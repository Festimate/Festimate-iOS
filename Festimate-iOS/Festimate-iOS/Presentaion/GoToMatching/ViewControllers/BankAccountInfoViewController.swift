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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setActions()
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
        bankAccountInfoView.copyButton.addTarget(self, action: #selector(copyAccountNumber), for: .touchUpInside)
        bankAccountInfoView.backToMainButton.addTarget(self, action: #selector(backToMainButtonDidTap), for: .touchUpInside)
    }
    
}

extension BankAccountInfoViewController {
    
    @objc
    func copyAccountNumber() {
        UIPasteboard.general.string = bankAccountInfoView.bankInfoLabel.text
        showToast()
    }
    
    @objc
    func backToMainButtonDidTap() {
        guard let navigationController = self.navigationController else { return }
        let mainViewController = MainViewController()
        
        navigationController.setViewControllers([mainViewController], animated: true)
    }
    
    //토스트 메세지 띄우기
    func showToast() {
        guard let windowScene = UIApplication.shared.connectedScenes
            .first(where: { $0 is UIWindowScene }) as? UIWindowScene,
              let rootView = windowScene.windows.first else { return }
        
        let toastView = ToastView()
        rootView.addSubview(toastView)
        
        toastView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(518)
            $0.horizontalEdges.equalToSuperview().inset(47)
            $0.height.equalTo(63)
        }
        
        UIView.animate(withDuration: 3.0) {
            toastView.alpha = 0
        } completion: { _ in
            toastView.removeFromSuperview()
        }
    }
    
}


