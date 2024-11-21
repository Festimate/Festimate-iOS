//
//  RegisterState.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/21/24.
//

import Foundation

struct RegisterState: Equatable{
    let currentStep: RegisterStep
    let name: String
    let nickname: String
    let nicknameError: String
    let nicknameErrorState: ValidationState
    let nicknameValid: Bool
    let age: String
    let gender: Gender
    let school: String
    let height: String
    let selectedMBTIs: Set<String>
    let selectedFaces: [String]
    let buttonState: ButtonState
    
    init(
        currentStep: RegisterStep = .first,
        name: String = "",
        nickname: String = "",
        nicknameError: String = "",
        nicknameErrorState: ValidationState = .empty,
        nicknameValid: Bool = false,
        age: String = "",
        gender: Gender = .unSelected,
        school: String = "",
        height: String = "",
        selectedMBTIs: Set<String> = [],
        selectedFaces: [String] = [],
        buttonState: ButtonState = .disable
    ) {
        self.currentStep = currentStep
        self.name = name
        self.nickname = nickname
        self.nicknameError = nicknameError
        self.nicknameErrorState = nicknameErrorState
        self.nicknameValid = nicknameValid
        self.age = age
        self.gender = gender
        self.school = school
        self.height = height
        self.selectedMBTIs = selectedMBTIs
        self.selectedFaces = selectedFaces
        self.buttonState = buttonState
    }
    
    func copy(
        currentStep: RegisterStep? = nil,
        name: String? = nil,
        nickname: String? = nil,
        nicknameError: String? = nil,
        nicknameErrorState: ValidationState? = nil,
        nicknameValid: Bool? = nil,
        age: String? = nil,
        gender: Gender? = nil,
        school: String? = nil,
        height: String? = nil,
        selectedMBTIs: Set<String>? = nil,
        selectedFaces: [String]? = nil,
        buttonState: ButtonState? = nil
    ) -> RegisterState {
        return RegisterState(
            currentStep: currentStep ?? self.currentStep,
            name: name ?? self.name,
            nickname: nickname ?? self.nickname,
            nicknameError: nicknameError ?? self.nicknameError,
            nicknameErrorState: nicknameErrorState ?? self.nicknameErrorState,
            nicknameValid: nicknameValid ?? self.nicknameValid,
            age: age ?? self.age,
            gender: gender ?? self.gender,
            school: school ?? self.school,
            height: height ?? self.height,
            selectedMBTIs: selectedMBTIs ?? self.selectedMBTIs,
            selectedFaces: selectedFaces ?? self.selectedFaces,
            buttonState: buttonState ?? self.buttonState
        )
    }
    
    static func == (lhs: RegisterState, rhs: RegisterState) -> Bool {
        return lhs.currentStep == rhs.currentStep &&
        lhs.name == rhs.name &&
        lhs.nickname == rhs.nickname &&
        lhs.nicknameError == rhs.nicknameError &&
        lhs.nicknameErrorState == rhs.nicknameErrorState &&
        lhs.nicknameValid == rhs.nicknameValid &&
        lhs.age == rhs.age &&
        lhs.gender == rhs.gender &&
        lhs.school == rhs.school &&
        lhs.height == rhs.height &&
        lhs.selectedMBTIs == rhs.selectedMBTIs &&
        lhs.selectedFaces == rhs.selectedFaces &&
        lhs.buttonState == rhs.buttonState
    }
}
