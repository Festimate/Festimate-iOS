//
//  BaseTargetType.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/28/24.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType {
    var utilPath: String { get }
    var method: Moya.Method { get }
}

extension BaseTargetType {
    
    var baseURL: URL {
        guard let urlString = Bundle.main.infoDictionary?["BASE_URL"] as? String,
              let url = URL(string: urlString) else {
            fatalError("🚨BASE_URL을 찾을 수 없습니다🚨")
        }
        return url
    }
    
    var headers: [String : String]? {
        let headers = ["Content-Type" : "application/json"]
        return headers
    }
    
}
