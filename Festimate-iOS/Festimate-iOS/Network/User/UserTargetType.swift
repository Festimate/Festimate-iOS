//
//  UserTargetType.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/28/24.
//

import Foundation

import Moya

enum UserTargetType {
    case getUserDetail
}

extension UserTargetType: BaseTargetType {
    var utilPath: String {
        return "festimate/v1/user-detail"
    }
    
    var path: String {
        switch self {
        case .getUserDetail:
            return utilPath
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getUserDetail:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "userId": TokenManager.shared.read() ?? "1"
        ]
    }
}

