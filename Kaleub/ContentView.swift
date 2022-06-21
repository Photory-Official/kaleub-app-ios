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
        SignUpView()
            .environmentObject(SignUpViewModel())
    }
}
