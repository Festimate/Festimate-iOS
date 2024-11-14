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
}