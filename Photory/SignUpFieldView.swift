//
//  SignUpFieldView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct SignUpFieldView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var viewModel: SignUpViewModel
    
    // TODO: v2 버전에서 String으로 넣어주는 title을 통합하여 관리하는 로직으로 대체합니다.
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            SignHeaderView("만나서 반가워!")
        
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .bottom) {
                        TextFieldView("이메일", $viewModel.email)
                        
                        Button {
                            viewModel.didTapVerificationMailButton()
                        } label: {
                            Image("app.button")
                                .overlay {
                                    Text("중복 확인")
                                        .foregroundColor(.black)
                                }
                        }
                        .disabled(viewModel.disabledEmailField)
                    }
                    
                    if !viewModel.disabledEmailField {
                        Text("앱에서 사용할 올바른 이메일을 입력해주세요.")
                            .font(.caption2)
                            .foregroundColor(.red)
                    }
                    
                }
            }
            .padding([.horizontal], 20)
            
            TextFieldView("비밀번호", $viewModel.password)
                .padding([.horizontal], 20)
            
            VStack(alignment: .leading, spacing: 4) {
                TextFieldView("비밀번호 확인", $viewModel.passwordCheck)
                
                if viewModel.disablePasswordMessage {
                    Text("비밀번호가 다릅니다.")
                        .font(.caption2)
                        .foregroundColor(.red)
                }
                
            }
            .padding([.horizontal], 20)
            
            TextFieldView("이름", $viewModel.nickname)
                .padding([.horizontal], 20)
            
            // TODO: 인증 번호 필드 디자인 개편중
            if viewModel.disabledEmailField {
                TextFieldView("해당 이메일로 발송된 인증번호를 입력해주세요.", $viewModel.emailCode)
                    .padding([.horizontal], 20)
            }
            
            Spacer()
            
            Text("회원가입")
                .modifier(AuthView.AuthButtonModifier())
                .onTapGesture {
                    viewModel.didTapSignUpButton()
//                    viewModel.showsWelcomeAlert = true
                }
                
            Spacer()
        }
        .alert("🎉 회원가입을 축하합니다.", isPresented: $viewModel.showsWelcomeAlert) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("🥳 확인")
            }

        }
    }
}

struct SignUpFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFieldView()
    }
}
