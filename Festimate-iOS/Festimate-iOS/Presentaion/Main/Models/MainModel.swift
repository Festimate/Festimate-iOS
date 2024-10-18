//
//  MainModel.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/10/24.
//

import UIKit

struct MainModel {
    let matchingState: Bool
    let location: String
    let time: String
    let nickname: String
    let school: String
    let age: Int
    let mbti: String
    let faceInfo1: String
    let faceInfo2: String
    let dressInfo: String
}

extension MainModel {
    static func dummy() -> [MainModel] {
        return [
            MainModel(matchingState: true, location: "스머프 동산", time: "20:00 PM", nickname: "쿠키", school: "가톨릭대학교", age: 25, mbti: "INFP", faceInfo1: "고양이상", faceInfo2: "아랍상", dressInfo: "폴로 셔츠에 가디건을 입고 있어요!"),
            MainModel(matchingState: false, location: "스머프 동산", time: "20:00 PM", nickname: "쿠키", school: "가톨릭대학교", age: 25, mbti: "INFP", faceInfo1: "강아지상", faceInfo2: "두부상", dressInfo: "폴로 셔츠에 가디건을 입고 있어요!"),
            MainModel(matchingState: true, location: "다솔관 앞", time: "16:00 PM", nickname: "나야 들기름", school: "숭실대학교", age: 22, mbti: "ENFJ", faceInfo1: "강아지상", faceInfo2: "두부상", dressInfo: "검정 맨투맨에 흑청 바지를 입고 있습니다")
        ]
    }
}
