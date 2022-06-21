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
        
        // FIXME: - NavigationView 연결해야 하는데, 잘못된 UI가 나타남. 해결책 아직 못찾음
        ZStack {
            Image("app.background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            
            
            HomeView()
            
        }
        
    }
}
