//
//  UserService.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/28/24.
//

import Foundation

import Moya


protocol UserServiceProtocol {
    func getUserDetail(completion: @escaping (NetworkResult<GetUserDetailResponse>) -> Void)
}

final class UserService: BaseService, UserServiceProtocol {
    
    static let shared = UserService()
    let provider = MoyaProvider<UserTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func getUserDetail(completion: @escaping (NetworkResult<GetUserDetailResponse>) -> Void) {
        provider.request(.getUserDetail) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                let data = result.data
                
                let networkResult: NetworkResult<GetUserDetailResponse> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}


