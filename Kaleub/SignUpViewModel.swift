//
//  SignUpViewModel.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordCheck: String = ""
    @Published var name: String = ""
    @Published var certificationNumber: String = ""
}
