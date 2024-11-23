//
//  LoginView.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/2/24.
//

import UIKit

import SnapKit
import Then

class LoginView: UIView {
    
    private let titleLabel = UILabel()
    
    private let titleImage = UIImageView(image: .mainLogo)
    
    private let kakaoLoginImage = UIImageView(image: .kakaoLogo)
    
    lazy var kakaoLoginButton = UIButton()
    
    lazy var appleLoginButton = UIButton()
    
    private let privacyPolicyLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        addSubviews(titleLabel, titleImage, kakaoLoginButton, appleLoginButton, privacyPolicyLabel)
        
        kakaoLoginButton.addSubview(kakaoLoginImage)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(261)
        }
        
        titleImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(39)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(appleLoginButton.snp.top).offset(-16)
            $0.width.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        kakaoLoginImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(privacyPolicyLabel.snp.top).offset(-20)
            $0.width.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        privacyPolicyLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-55)
        }
    }
    
    func setStyle() {
        self.backgroundColor = .white
        
        titleLabel.do {
            $0.setLabel(text: "축제에서 이상형 찾기!\n내 취향에 맞는 매칭 서비스!", numberOfLines: 2, textColor: .gray06, font: .pretendard(.body_semi_17))
        }
        
        kakaoLoginButton.do {
            $0.setTitle("카카오 계정으로 로그인", for: .normal)
            $0.setTitleColor(.gray06, for: .normal)
            $0.backgroundColor = .kakaoYellow
            $0.layer.cornerRadius = 6
        }
        
        appleLoginButton.do {
            $0.setTitle("Apple ID로 로그인", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .gray06
            $0.layer.cornerRadius = 6
        }
        
        privacyPolicyLabel.do {
            $0.setLabel(numberOfLines: 1, textColor: .gray04, font: .pretendard(.body_med_15))
            $0.setUnderlinedText("개인정보처리방침")
        }
    }
}
