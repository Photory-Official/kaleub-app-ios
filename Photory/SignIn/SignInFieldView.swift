//
//  SignInField.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct SignInFieldView: View {
    @EnvironmentObject var viewModel: SignInViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            
            TextFieldView("아이디(이메일 주소)", $viewModel.email)
                .padding([.horizontal], 20)
            
            TextFieldView("비밀번호", $viewModel.password)
                .padding([.horizontal], 20)
                
        }
    }
}

struct SignInField_Previews: PreviewProvider {
    static var previews: some View {
        SignInFieldView()
    }
}
