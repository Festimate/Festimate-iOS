//
//  AddMatchingModel.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/19/24.
//
import Foundation

struct AddMatchingModel {
    let isIdealTypeInput: Bool
    let isPreferenceInput: Bool
}

struct MatchingModel: Codable {
    var minHeight: Int
    var maxHeight: Int
    var minAge: Int
    var maxAge: Int
    var mbti: String
    var appearanceList: [String]
    var questionList: [Int]
    var timeList: [String]
    var dress: String
}


