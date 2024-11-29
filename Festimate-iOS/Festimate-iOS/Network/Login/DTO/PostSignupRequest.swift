//
//  PostSignupRequest.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/28/24.
//

import Foundation

struct PostSignupRequest: Codable {
    let username: String
    let nickname: String
    let age: Int
    let gender: String
    let school: String
    let height: Int
    let mbti: String
    let appearanceList: [String]
}
