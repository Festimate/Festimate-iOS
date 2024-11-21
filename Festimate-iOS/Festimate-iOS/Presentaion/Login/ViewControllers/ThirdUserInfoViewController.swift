//
//  ThirdUserInfoViewController.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit

class ThirdUserInfoViewController: UIViewController {
    
    let thirdUserInfoView = ThirdUserInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setHierarchy()
        setLayout()
        setStyle()
    }

    func setHierarchy() {
        self.view.addSubview(thirdUserInfoView)
    }
    
    func setLayout() {
        thirdUserInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = .white
    }
}
