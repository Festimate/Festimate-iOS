//
//  MyPreferenceModel.swift
//  Festimate-iOS
//
//  Created by 김희은 on 11/16/24.
//

struct MyPreferenceModel {
    let isOkInput: Bool
    let isNoInput: Bool
}

extension MyPreferenceModel {
    static func sampleData() -> MyPreferenceModel {
        return MyPreferenceModel(isOkInput: true, isNoInput: true)
    }
}

