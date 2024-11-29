//
//  MatchingTargetType.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/28/24.
//

import Foundation

import Moya

enum MatchingTargetType {
    case postMatching(matching: PostMatchingRequest)
}

extension MatchingTargetType: BaseTargetType {
    var utilPath: String {
        return "festimate/v1/matching"
    }
    
    var path: String {
        switch self {
        case .postMatching:
            return utilPath
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Moya.Task {
        switch self {
        case .postMatching(let matching):
            return .requestJSONEncodable(matching)
        }
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "userId": TokenManager.shared.read() ?? "1"
        ]
    }
}


