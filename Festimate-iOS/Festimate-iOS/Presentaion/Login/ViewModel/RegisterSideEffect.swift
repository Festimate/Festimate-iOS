//
//  RegisterSideEffect.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/21/24.
//

import Foundation

enum RegisterSideEffect {
    case complete
    case pop
    case nextStep(step: RegisterStep)
    case previousStep(step: RegisterStep)
}
