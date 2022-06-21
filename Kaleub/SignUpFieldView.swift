//
//  SignUpFieldView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct SignUpFieldView: View {
    @EnvironmentObject var viewModel: SignUpViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Spacer()
                .frame(height: 100)
            
            Text("만나서 반가워")
            
            Spacer()
                .frame(height: 100)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .bottom) {
                        TextFieldView("아이디(이메일 주소)", $viewModel.email)
                        
                        Image("button")
                            .overlay {
                                Text("중복 확인")
                            }
                    }
                    
                    Text("이메일이 존재하지 않습니다.")
                        .font(.caption2)
                        .foregroundColor(.red)
                }
                
            }
            .padding([.horizontal], 20)
            
            TextFieldView("비밀번호", $viewModel.password)
                .padding([.horizontal], 20)
            
            VStack(alignment: .leading, spacing: 4) {
                TextFieldView("비밀번호 확인", $viewModel.passwordCheck)
                
                Text("비밀번호가 존재하지 않습니다.")
                    .font(.caption2)
                    .foregroundColor(.red)
            }
            .padding([.horizontal], 20)
            
            TextFieldView("이름", $viewModel.name)
                .padding([.horizontal], 20)
            
            // TODO: 인증 번호 필드 디자인 개편중
            Spacer()
        }
    }
}

struct SignUpFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFieldView()
    }
}
