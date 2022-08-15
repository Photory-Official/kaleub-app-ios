//
//  KaleubApp.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/15.
//

import SwiftUI
import PhotorySDK

@main
struct PhotoryApp: App {
    @State var userToken: String? = Photory.userToken
    
    var body: some Scene {
        WindowGroup {
            if userToken != nil {
                HomeView()
            } else {
                AuthView()
            }
        }
    }
    
}
