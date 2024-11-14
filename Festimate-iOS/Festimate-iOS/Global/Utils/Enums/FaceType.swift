//
//  FaceType.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/14/24.
//

import UIKit

enum FaceType: String, CaseIterable {
    case cat = "고양이상"
    case dog = "강아지상"
    case dinosaur = "공룡상"
    case fox = "여우상"
    case bear = "곰상"
    case rabbit = "토끼상"
    case arab = "아랍상"
    case tofu = "두부상"
    
    static var faceTypeData: [String] {
        return FaceType.allCases.map { $0.rawValue }
    }
}
