//
//  AddMatchingModel.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/19/24.
//

struct AddMatchingModel {
    let isIdealTypeInput: Bool
    let isPreferenceInput: Bool
}

extension AddMatchingModel {
    static func sampleData() -> AddMatchingModel {
        return AddMatchingModel(isIdealTypeInput: false, isPreferenceInput: true)
    }
}

