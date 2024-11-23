//
//  SecondUserInfoViewController.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit

class SecondUserInfoViewController: UIViewController {

    let secondUserInfoView = SecondUserInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setHierarchy()
        setLayout()
        setStyle()
    }

    func setHierarchy() {
        self.view.addSubview(secondUserInfoView)
    }
    
    func setLayout() {
        secondUserInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = .white
    }
}
