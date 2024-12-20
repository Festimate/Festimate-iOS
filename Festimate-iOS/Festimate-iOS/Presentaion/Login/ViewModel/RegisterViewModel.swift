//
//  RegisterViewModel.swift
//  Festimate-iOS
//
//  Created by 우상욱 on 11/21/24.
//

import UIKit
import Combine

class RegisterViewModel {
    
    @Published var registerState = RegisterState()
    
    let sideEffect = PassthroughSubject<RegisterSideEffect, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let oppositeMBTI: [String: String] = [
        "E":"I", "I":"E",
        "N":"S", "S":"N",
        "F":"T", "T":"F",
        "P":"J", "J":"P"
    ]
    
    private var signupService: SignupService?
    private var tokenManager: TokenManager?
    
    init() {
        signupService = NetworkService.shared.signupService
        
        tokenManager = TokenManager.shared
        
        $registerState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.checkValidation(step: state.currentStep)
            }
            .store(in: &cancellables)
    }
    
    func backbuttonTapped() {
        switch(registerState.currentStep){
        case .first: sendPopSideEffect()
        case .second: registerState = registerState.copy(currentStep: .first)
            sendPreviousStepSideEffect(step: .first)
        case .third: registerState = registerState.copy(currentStep: .second)
            sendPreviousStepSideEffect(step: .second)
        }
    }
    
    func registerButtonTapped() {
        switch(registerState.currentStep){
        case .first: registerState = registerState.copy(currentStep: .second)
            sendNextStepSideEffect(step: .second)
        case .second: registerState = registerState.copy(currentStep: .third)
            sendNextStepSideEffect(step: .third)
        case .third: performRegister()
        }
    }
    
    func performRegister() {
        signupService?.postSignup(body: PostSignupRequest(username: registerState.name, nickname: registerState.nickname, age: Int(registerState.age) ?? 20, gender: genderString(from: registerState.gender), school: registerState.school, height: Int(registerState.height) ?? 170, mbti: mbtiString(from: registerState.selectedMBTIs) ?? "ENFP", appearanceList: registerState.selectedFaces)){ [weak self] response in
            guard let self = self else { return }
            
            switch response.self {
                
            case .success(let response):
                self.tokenManager?.create(value: String(response.userId))
                sendCompleteSideEffect()
            case .requestErr:
                print("요청 오류입니다")
            case .decodedErr:
                print("디코딩 오류입니다")
            case .pathErr:
                print("경로 오류입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
    
    func mbtiString(from set: Set<String>) -> String? {
        let mbtiOrder = ["I", "E", "N", "S", "T", "F", "J", "P"]
        
        let sortedMBTI = mbtiOrder.filter { set.contains($0) }
        
        return sortedMBTI.count == 4 ? sortedMBTI.joined() : nil
    }
    
    func genderString(from gender: Gender) -> String {
        switch gender {
            
        case .woman:
            return "여자"
        case .man:
            return "남자"
        case .unSelected:
            return "오류"
        }
    }
    
    func sendPopSideEffect() {
        sideEffect.send(.pop)
    }
    
    func sendCompleteSideEffect() {
        sideEffect.send(.complete)
    }
    
    func sendNextStepSideEffect(step: RegisterStep) {
        sideEffect.send(.nextStep(step: step))
    }
    
    func sendPreviousStepSideEffect(step: RegisterStep) {
        sideEffect.send(.previousStep(step: step))
    }
    
    func updateName(name: String) {
        if(name.count <= 10){
            registerState = registerState.copy(name: name)
        } else {
            registerState = registerState.copy()
        }
    }
    
    func updateNickname(nickname: String) {
        if(nickname.count <= 10){
            registerState = registerState.copy(nickname: nickname, nicknameErrorState: .notChecked, nicknameValid: false)
        } else {
            registerState = registerState.copy()
        }
    }
    
    func updateAge(age: String) {
        if(age.count <= 2){
            registerState = registerState.copy(age: age)
        } else {
            registerState = registerState.copy()
        }
    }
    
    func updateSchool(school: String) {
        if(school.count <= 10){
            registerState = registerState.copy(school: school)
        } else {
            registerState = registerState.copy()
        }
    }
    
    func updateHeight(height: String) {
        if(height.count <= 3){
            registerState = registerState.copy(height: height)
        } else {
            registerState = registerState.copy()
        }
    }
    
    func womanButtonTapped() {
        if(registerState.gender == .woman){
            registerState = registerState.copy(gender: .unSelected)
        } else {
            registerState = registerState.copy(gender: .woman)
        }
    }
    
    func manButtonTapped() {
        if(registerState.gender == .man){
            registerState = registerState.copy(gender: .unSelected)
        } else {
            registerState = registerState.copy(gender: .man)
        }
    }
    
    func validateButtonTapped() {
        signupService?.postCheckNickname(body: PostCheckNicknameRequest(nickname: registerState.nickname))
        { [weak self] response in
                guard let self = self else { return }
                
                switch response.self {
                    
                case .success(let response):
                    registerState = registerState.copy(nicknameError: "사용가능한 닉네임 입니다.", nicknameErrorState: .valid, nicknameValid: true)
                case .requestErr:
                    registerState = registerState.copy(nicknameError: "중복된 닉네임 입니다.", nicknameErrorState: .invalid, nicknameValid: true)
                case .decodedErr:
                    print("디코딩 오류입니다")
                case .pathErr:
                    print("경로 오류입니다")
                case .serverErr:
                    print("서버 오류입니다")
                case .networkFail:
                    print("네트워크 오류입니다")
                }
        }
    }
    
    func mbtiButtonTapped(letter: String) {
        var newSelectedMBTIs = registerState.selectedMBTIs
        if(newSelectedMBTIs.contains(letter)) {
            newSelectedMBTIs.remove(letter)
        } else {
            newSelectedMBTIs.insert(letter)
            
            if let opposite = oppositeMBTI[letter] {
                newSelectedMBTIs.remove(opposite)
            }
        }
        
        registerState = registerState.copy(selectedMBTIs: newSelectedMBTIs)
    }
    
    func faceTypeButtonTapped(letter: String) {
        var newSelectedFaceTypes = registerState.selectedFaces
        if(newSelectedFaceTypes.contains(letter)) {
            newSelectedFaceTypes.removeAll { $0 == letter }
        } else {
            newSelectedFaceTypes.append(letter)
            
            if newSelectedFaceTypes.count > 2 {
                newSelectedFaceTypes.removeFirst()
            }
        }
        
        registerState = registerState.copy(selectedFaces: newSelectedFaceTypes)
    }
    
    func checkValidation(step: RegisterStep) {
        var newState = registerState
        switch step {
        case .first:
            newState = validateFirstStep()
        case .second:
            newState = validateSecondStep()
        case .third:
            newState = validateThirdStep()
        }
        
        if (newState != registerState) {
            registerState = newState
        }
    }
    
    func validateFirstStep() -> RegisterState {
        var errors: [String] = []
        var newState = registerState
        if newState.name.count < 1 || newState.name.count > 10 {
            errors.append("이름은 1~10자 사이여야 합니다.")
        }
        let koreanRegex = "^[가-힣ㄱ-ㅎㅏ-ㅣ]{1,10}$"
        
        if(!newState.nicknameValid){
            errors.append("닉네임 중복 확인 필요")
            let nicknamePredicate = NSPredicate(format: "SELF MATCHES %@", koreanRegex)
            
            if(newState.nickname.isEmpty){
                newState = newState.copy(nicknameError: "한글만 가능, 최소 1자 ~ 최대 10자", nicknameErrorState: .empty)
            } else {
                if !nicknamePredicate.evaluate(with: registerState.nickname) {
                    newState = newState.copy(nicknameError: "한글만 입력 가능", nicknameErrorState: .invalid)
                } else {
                    newState = newState.copy(nicknameError: "한글만 가능, 최소 1자 ~ 최대 10자", nicknameErrorState: .notChecked)
                }
            }
        }
        
        if(newState.nicknameErrorState == .invalid) {
            errors.append("닉네임 invalid")
        }
        
        if let ageInt = Int(newState.age) {
            if ageInt > 100 || ageInt < 1 {
                errors.append("나이는 1~100 사이의 숫자여야 합니다.")
            }
        } else {
            errors.append("나이는 숫자 형식이어야 합니다.")
        }
        
        let schoolPredicate = NSPredicate(format: "SELF MATCHES %@", koreanRegex)
        if !schoolPredicate.evaluate(with: newState.school) {
            errors.append("학교 이름은 1~10자의 한글이어야 합니다.")
        }
        
        if(errors.isEmpty){
            newState = newState.copy(buttonState: .enable)
        } else {
            newState = newState.copy(buttonState: .disable)
        }
        
        return newState
    }
    
    func validateSecondStep() -> RegisterState {
        var errors: [String] = []
        var newState = registerState
        
        if let heightInt = Int(newState.height) {
            if heightInt > 250 || heightInt < 100 {
                errors.append("키는 100~250 사이의 숫자여야 합니다.")
            }
        } else {
            errors.append("나이는 숫자 형식이어야 합니다.")
        }
        
        if(newState.selectedMBTIs.count != 4){
            errors.append("4개 선택해야 합니다.")
        }
        
        if(errors.isEmpty){
            newState = newState.copy(buttonState: .enable)
        } else {
            newState = newState.copy(buttonState: .disable)
        }
        
        return newState
    }
    
    func validateThirdStep() -> RegisterState {
        var errors: [String] = []
        var newState = registerState
        
        if(newState.selectedFaces.count != 2){
            errors.append("2개 선택해야 합니다.")
        }
        
        if(errors.isEmpty){
            newState = newState.copy(buttonState: .complete)
        } else {
            newState = newState.copy(buttonState: .uncomplete)
        }
        
        return newState
    }
}
