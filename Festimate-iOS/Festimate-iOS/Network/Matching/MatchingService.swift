//
//  MatchingService.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/28/24.
//

import UIKit

import Moya

protocol MatchingServiceProtocol {
    func postMatching(matching: PostMatchingRequest, completion: @escaping (Bool) -> Void)
}

final class MatchingService: BaseService, MatchingServiceProtocol {
    let provider = MoyaProvider<MatchingTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func postMatching(matching: PostMatchingRequest, completion: @escaping (Bool) -> Void) {
        provider.request(.postMatching(matching: matching)) { result in
            switch result {
            case .success(let response):
                completion(true)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}
