//
//  SignInViewModel.swift
//  Photory
//
//  Created by Hamlit Jason on 2022/08/16.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
