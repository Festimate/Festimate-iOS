//
//  SignupService.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/28/24.
//

import UIKit

import Moya

protocol SignupServiceProtocol {
    func postSignup(body: PostSignupRequest, completion: @escaping (NetworkResult<PostSignupResponse>) -> Void)
}

final class SignupService: BaseService, SignupServiceProtocol {
    
    let provider = MoyaProvider<SignupTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func postSignup(body: PostSignupRequest, completion: @escaping (NetworkResult<PostSignupResponse>) -> Void) {
        provider.request(.postSignup(body: body)) { result in
            switch result {
            case .success(let result):
                let statusCode = result.statusCode
                let data = result.data
                
                let networkResult: NetworkResult<PostSignupResponse> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}
