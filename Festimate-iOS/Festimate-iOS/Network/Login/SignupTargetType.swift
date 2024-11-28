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
    case checkNickname(nickname: String)
}
                    
extension SignupTargetType: BaseTargetType {
    var utilPath: String {
        switch self {
        case .postSignup:
            return "festimate/v1/signup"
        case .checkNickname:
            return "festimate/v1/check-nickname"
        }
    }
    
    var path: String {
        switch self {
        case .postSignup:
            return utilPath
        case .checkNickname:
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
        case .checkNickname(let nickname):
            return .requestParameters(parameters: ["nickname": nickname], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return [
            "Content-Type": "application/json"
        ]
    }
}
