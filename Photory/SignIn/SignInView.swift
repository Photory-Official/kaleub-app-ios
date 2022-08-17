//
//  SignInView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI
import PhotorySDK

struct SignInView: View {
    @EnvironmentObject var viewModel: SignInViewModel
    @EnvironmentObject var appViewModel: PhotoryAppViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    SignHeaderView("어서와!")
                    
                    SignInFieldView()
                        .environmentObject(viewModel)
                    
                    Spacer()
                    
                    Button {
                        // NOTE: - 로그인 액션
                        viewModel.didTapLoginButton(
                            email: viewModel.email,
                            password: viewModel.password
                        )
                        
                        viewModel.showsWelcomeAlert = true
                        appViewModel.userToken = "test"
                        
                    } label: {
                        Text("로그인")
                            .modifier(AuthView.AuthButtonModifier())
                    }

                    NavigationLink {
                        SignUpView()
                            .environmentObject(SignUpViewModel())
                    } label: {
                        Text("회원가입")
                            .modifier(AuthView.AuthButtonModifier())
                    }
 
                }
            }
            .background {
                Image("app.background")
            }
            .alert("🎉Welcome🎉", isPresented: $viewModel.showsWelcomeAlert) {
                Button {
                    // NOTE: - Scene 교체?
                    
                } label: {
                    Text("🥳 포토리 시작하기")
                }

            }.navigationBarHidden(true)
        }
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
