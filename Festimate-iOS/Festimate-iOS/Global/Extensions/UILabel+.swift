//
//  UILabel+.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/4/24.
//

import UIKit

extension UILabel {
    
    // 기본 라벨 속성 설정 메소드
    func setLabel(text: String? = "", alignment: NSTextAlignment = .center, numberOfLines: Int = 0, textColor: UIColor, font: UIFont) {
        self.text = text
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.textColor = textColor
        self.font = font
    }
    
    //특정 문자열의 색을 바꾸는 메소드
    func setColorForText(_ targetText: String, with color: UIColor) {
        guard let labelText = self.text else { return }
        
        let attributedString = NSMutableAttributedString(string: labelText)
        let range = (labelText as NSString).range(of: targetText)
        
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
            self.attributedText = attributedString
        }
    }
    
    // 밑줄 긋는 메소드
    func setUnderlinedText(_ text: String) {
            let attributes: [NSAttributedString.Key: Any] = [
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
            self.attributedText = NSAttributedString(string: text, attributes: attributes)
        }
}
