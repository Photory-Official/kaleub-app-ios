//
//  SignFooterView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct AuthenticationButton: View {
    let type: ActionType
    
    enum ActionType {
        case signUp
        case signIn
    }
    
    init(_ type: ActionType) {
        self.type = type
    }
    
    var body: some View {
        if type == .signIn {
            Button("로그인") {
                // TODO: action
            }
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .frame(width: 300, height: 60, alignment: .center)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
            }
        } else if type == .signUp {
            Button("회원가입") {
                // TODO: action
            }
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .frame(width: 300, height: 60, alignment: .center)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
            }
        }
    }
}

struct SignFooterView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationButton(.signIn)
    }
}
