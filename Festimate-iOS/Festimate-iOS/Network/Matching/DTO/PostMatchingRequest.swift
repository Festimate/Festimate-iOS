//
//  PostMatchingRequest.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/28/24.
//

import Foundation

struct PostMatchingRequest: Codable {
    let minHeight: Int
    let maxHeight: Int
    let minAge: Int
    let maxAge: Int
    let mbti: String
    let appearanceList: [String]
    let questionList: [Int]
    let timeList: [String]
    let dress: String
}
