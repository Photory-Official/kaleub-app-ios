//
//  SignInViewModel.swift
//  Photory
//
//  Created by Hamlit Jason on 2022/08/16.
//

import SwiftUI
import PhotorySDK

class SignInViewModel: ObservableObject {
    @Published var email: String = "" {
        didSet { print("email \(email)") }
    }
    @Published var password: String = "" {
        didSet { print("password \(password)") }
    }
    /// 로그인 성공시
    @Published var showsWelcomeAlert: Bool = false
    /// 로그인 버튼을 눌렀을 때
    func didTapLoginButton(email: String, password: String) {
        print("didTapLogin \(email) \(password)")
        guard email.contains("@") else { return }
        guard (6...8) ~= password.count else { return }
        
        // FIXME: - PhotorySDK.APIClient.APIError error 0.
        Photory.signIn(email: email, password: password) { result in
            switch result {
            case .success(let token):
                print("✅ success: \(token)")
                UserDefaults.standard.set(token, forKey: "token")
                self.showsWelcomeAlert = true
            case .failure(let error):
                print("🚨 Error: \(error.localizedDescription)")
            }
        }
    }
}
