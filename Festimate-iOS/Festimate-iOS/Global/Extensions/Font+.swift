//
//  Font+.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/2/24.
//

import UIKit

enum FontName {
    
    case title_extra_24, title_extra_20
    case title_bold_20, title_bold_18, body_bold_17, body_bold_15, cap_bold_11
    case body_semi_17, body_semi_15, body_semi_13
    case body_med_17, body_med_15, body_med_13
    case cap_reg_11
    
    
    var rawValue: String {
        switch self {
        case .title_extra_24, .title_extra_20:
            return "Pretendard-ExtraBold"
        case .title_bold_20, .title_bold_18, .body_bold_17, .body_bold_15, .cap_bold_11:
            return "Pretendard-Bold"
        case .body_semi_17, .body_semi_15, .body_semi_13:
            return "Pretendard-SemiBold"
        case .cap_reg_11:
            return "Pretendard-Regular"
        case .body_med_17, .body_med_15, .body_med_13:
            return "Pretendard-Medium"
        }
    }
    
    var size: CGFloat {
        switch self {
        case .title_extra_24:
            return 24
        case .title_extra_20, .title_bold_20:
            return 20
        case .title_bold_18:
            return 18
        case .body_bold_17, .body_semi_17, .body_med_17:
            return 17
        case .body_bold_15, .body_semi_15, .body_med_15:
            return 15
        case .body_semi_13, .body_med_13:
            return 13
        case .cap_reg_11, .cap_bold_11:
            return 11
        }
    }
}

extension UIFont {
    
    static func pretendard(_ style: FontName) -> UIFont {
        return UIFont(name: style.rawValue, size: style.size)!
    }
    
}

