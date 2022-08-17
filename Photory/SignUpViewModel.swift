//
//  SignUpViewModel.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI
import PhotorySDK

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var emailCode: String = ""
    @Published var password: String = ""
    @Published var passwordCheck: String = "" {
        didSet {
            disablePasswordMessage = password == passwordCheck
            ? false
            : true
        }
    }
    @Published var nickname: String = ""
    @Published var certificationNumber: String = ""
    
    @Published var disabledEmailField: Bool = false
    @Published var disablePasswordMessage: Bool = false
    
    @Published var showsWelcomeAlert: Bool = false
    /// 이메일 중복 여부를 확인
    func didTapVerificationMailButton() {
        print("\(#function) email: \(email)")
        
        Photory.sendVerificationMail(to: email) { result in
            switch result {
            case .success():
                self.disabledEmailField = true
                print("success")
            case .failure(let error): print("🚨 Error: \(error.localizedDescription)")
            }
        }
    }
    
    /// 회원가입 버튼 눌렀을 때
    func didTapSignUpButton() {
        print("\(#function)")
        guard disabledEmailField else { return }
        
        Photory.signUp(email: email, password: password, nickname: nickname) { result in
            switch result {
            case .success():
                
                print("✅ success: ")
                break
            case .failure(let error):
                print("🚨 Error: \(error.localizedDescription)")
            }
        }
    }
    

}
