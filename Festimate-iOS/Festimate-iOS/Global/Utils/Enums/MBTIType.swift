//
//  MBTIType.swift
//  Festimate-iOS
//
//  Created by 김민서 on 11/14/24.
//

import UIKit

enum MBTIType: String, CaseIterable {
    case e = "E"
    case i = "I"
    case n = "N"
    case s = "S"
    case f = "F"
    case t = "T"
    case p = "P"
    case J = "J"
    
    
    static var mbtiData: [String] {
        return MBTIType.allCases.map { $0.rawValue }
    }
    
    func getGroup() -> String {
        switch self {
        case .e, .i:
            return "EI"
        case .n, .s:
            return "NS"
        case .f, .t:
            return "FT"
        case .p, .J:
            return "PJ"
        }
    }
}
