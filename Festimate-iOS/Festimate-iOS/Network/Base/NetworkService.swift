//
//  NetworkService.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/28/24.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
   
    let userService: UserService = UserService()
    
    let matchingService: MatchingService = MatchingService()

}
