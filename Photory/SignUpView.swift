//
//  SignUpvView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct SignUpView: View {
    
    var body: some View {
        ZStack {
            SignUpFieldView()
            
        }
        .background {
            Image("app.background")
        }
    }
}

struct SignUpvView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
