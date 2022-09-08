//
//  AuthView.swift
//  Photory
//
//  Created by Hamlit Jason on 2022/08/15.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        SignInView()
            .environmentObject(SignInViewModel())
    }
    
    struct AuthButtonModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
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

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
