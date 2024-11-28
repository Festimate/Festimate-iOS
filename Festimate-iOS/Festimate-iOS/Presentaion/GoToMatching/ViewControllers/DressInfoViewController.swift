//
//  DressInfoViewController.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/19/24.
//

import UIKit

import Then
import SnapKit

final class DressInfoViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let dressInfoView: DressInfoView = DressInfoView()
    
    // MARK: - Properties
    
    var matchingModel: MatchingModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
        setActions()
        updateCompleteButtonState()
    }
    
    func setHierarchy() {
        self.view.addSubview(dressInfoView)
    }
    
    
    func setLayout() {
        dressInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setDelegate() {
        self.dressInfoView.dressInfoTextView.delegate = self
    }
    
    func setActions() {
        dressInfoView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        dressInfoView.completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
}

extension DressInfoViewController {
    
    @objc
    func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc
    func completeButtonDidTap() {
        matchingModel?.dress = dressInfoView.dressInfoTextView.text
        
        //아직 구현전이라 임시 데이터 지정
        matchingModel?.questionList = [1, 3, 2, 2, 1]
        
        // MatchingModel을 PostMatchingRequest로 변환
        guard let matchingModel = matchingModel else {
            return
        }
        
        let postMatchingRequest = PostMatchingRequest(
            minHeight: matchingModel.minHeight,
            maxHeight: matchingModel.maxHeight,
            minAge: matchingModel.minAge,
            maxAge: matchingModel.maxAge,
            mbti: matchingModel.mbti,
            appearanceList: matchingModel.appearanceList,
            questionList: matchingModel.questionList,
            timeList: matchingModel.timeList,
            dress: matchingModel.dress
        )
        
        postMatching(matching: postMatchingRequest) { success in
            if success {
                let bankAccountInfoViewController = BankAccountInfoViewController()
                self.navigationController?.pushViewController(bankAccountInfoViewController, animated: true)
            } else {
                print("서버 통신 실패")
            }
        }
    }
    
    func postMatching(matching: PostMatchingRequest, completion: @escaping (Bool) -> Void) {
        NetworkService.shared.matchingService.postMatching(matching: matching) { success in
            completion(success)
        }
    }
    
    func updateCompleteButtonState() {
        //placeholder도 입력된 문자로 인식해서 색상으로 조건 추가해야함
        let isTextEntered = !dressInfoView.dressInfoTextView.text.isEmpty && dressInfoView.dressInfoTextView.textColor != .gray04
        
        dressInfoView.completeButton.backgroundColor = isTextEntered ? .mainCoral : .gray03
        dressInfoView.completeButton.isEnabled = isTextEntered
    }
    
}

extension DressInfoViewController: UITextViewDelegate {
    
    // 사용자가 입력을 시작할 때 호출
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .gray04 {
            textView.text = nil  // placeholder 제거
            textView.textColor = .gray06
        }
    }
    
    // 사용자가 입력을 중일 때 호출
    func textViewDidChange(_ textView: UITextView) {
        let currentText = textView.text ?? ""
        let textCount = currentText.count
        dressInfoView.textCountLabel.text = "\(textCount)/50"
        textView.textColor = textCount == 0 ? .gray04 : .gray06
        updateCompleteButtonState() // 버튼 상태 업데이트
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // 현재 텍스트와 변경될 텍스트를 계산
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        // 50자를 초과하지 않는 경우에만 입력 허용
        return updatedText.count <= 50
    }
    
    // 사용자가 입력을 끝냈을 때 호출
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "ex) 저는 회색 가디건에 청치마를 입고 있어요!"  // placeholder 다시 불러오기
            textView.textColor = .gray04
        }
    }
}

