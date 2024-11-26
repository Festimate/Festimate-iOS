//
//  FirstUserInfoViewController.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/20/24.
//

import UIKit

class FirstUserInfoViewController: UIViewController {

    let firstUserInfoView = FirstUserInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setHierarchy()
        setLayout()
        setStyle()
    }

    func setHierarchy() {
        self.view.addSubview(firstUserInfoView)
    }
    
    func setLayout() {
        firstUserInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = .white
    }
}
