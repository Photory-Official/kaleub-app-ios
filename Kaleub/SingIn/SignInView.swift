//
//  SignInView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack {
            // NOTE: background의 경우에는 나중에 테마를 추가하면서 viewModel을 따로 만들 예정
            BackgroundView("background")
            
            VStack {
                SignHeaderView("어서와!")
                
                SignInFieldView()
                
                AuthenticationButton(.signIn)
                    .padding(.top, 284)

                Spacer()
                                    
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
