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
    
    func postCheckNickname(body: PostCheckNicknameRequest, completion: @escaping (NetworkResult<Bool>) -> Void) {
        provider.request(.checkNickname(nickname: body.nickname)) { result in
            switch result {
            case .success(let result):
                let statusCode = result.statusCode
                let data = result.data
                let networkResult: NetworkResult<Bool>
                switch statusCode {
                case 200..<205:
                    networkResult = .success(true)
                case 400..<409:
                    networkResult = .requestErr
                case 500:
                    networkResult = .serverErr
                default:
                    networkResult = .networkFail
                }
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
}
