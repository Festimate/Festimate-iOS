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

// 샘플 데이터 생성
extension MatchingModel {
    static func sample() -> MatchingModel {
        return MatchingModel(
            minHeight: 160,
            maxHeight: 180,
            minAge: 20,
            maxAge: 30,
            mbti: "ENFJ",
            appearanceList: ["강아지상", "고양이상"],
            questionList: [1, 2, 1, 3, 2],
            timeList: ["15:00", "17:00"],
            dress: "캐주얼한 후드티와 청바지"
        )
    }
}


extension AddMatchingModel {
    static func sampleData() -> AddMatchingModel {
        return AddMatchingModel(isIdealTypeInput: true, isPreferenceInput: true)
    }
}

