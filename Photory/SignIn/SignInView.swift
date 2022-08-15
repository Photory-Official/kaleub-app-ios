//
//  SignInView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    SignHeaderView("어서와!")
                    
                    SignInFieldView()
                    
                    Spacer()
                    
                    Button {
                        // NOTE: - 로그인 액션
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
            .navigationBarHidden(true)
        }
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
