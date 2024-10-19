//
//  AvailableTimeModel.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/19/24.
//

import UIKit

enum AvailableTimeModel: String, CaseIterable {
    case tenAM = "10 : 00"
    case elevenAM = "11 : 00"
    case twelvePM = "12 : 00"
    case onePM = "13 : 00"
    case twoPM = "14 : 00"
    case threePM = "15 : 00"
    case fourPM = "16 : 00"
    case fivePM = "17 : 00"
    case sixPM = "18 : 00"
    case sevenPM = "19 : 00"
    case eightPM = "20 : 00"
    case ninePM = "21 : 00"
    
    static var allHours: [String] {
        return AvailableTimeModel.allCases.map { $0.rawValue }
    }
}

