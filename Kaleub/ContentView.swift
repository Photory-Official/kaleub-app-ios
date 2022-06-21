//
//  ContentView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/15.
//

import SwiftUI
import KaleubSDK

struct ContentView: View {
    var body: some View {
        VStack {
//            SignInView()
            
//            SignUpView()
//                .environmentObject(SignUpViewModel())
//            AuthenticationButton(.signUp)
            
            NavigationView {
                HomeView()
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Image("app.logo")
                                .resizable()
                                .frame(width: 114, height: 32, alignment: .center)
                        }
                    }
            }
        }
    }
}
