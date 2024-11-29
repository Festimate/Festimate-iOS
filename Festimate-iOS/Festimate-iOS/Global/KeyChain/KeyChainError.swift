//
//  KeyChainError.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/28/24.
//

import Foundation

enum KeychainError: Error {
    case deleteFailed(String)
    case itemNotFound
    case unknownError
}
