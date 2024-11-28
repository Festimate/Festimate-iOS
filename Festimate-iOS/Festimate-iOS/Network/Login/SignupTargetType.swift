//
//  SignupTargetType.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/28/24.
//

import Foundation

import Moya

enum SignupTargetType {
    case postSignup(body: PostSignupRequest)
}
                    
extension SignupTargetType: BaseTargetType {
    var utilPath: String {
        return "festimate/v1/signup"
    }
    
    var path: String {
        switch self {
        case .postSignup:
            return utilPath
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Moya.Task {
        switch self {
        case .postSignup(let body):
            return .requestJSONEncodable(body)
        }
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
}
