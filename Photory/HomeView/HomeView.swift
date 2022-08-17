//
//  HomeView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct HomeView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @EnvironmentObject var viewModel: PhotoryAppViewModel
    
    var body: some View {
        ZStack {
            if viewModel.userToken == nil {
                AuthView()
                    .environmentObject(PhotoryAppViewModel())
            } else {
                NavigationView {
                    VStack {
                        // FIXME: dev용 임시버튼
                        NavigationLink {
                            FeedView()
                                .environmentObject(FeedViewModel())
                        } label: {
                            Text("GOTO FeedView dev")
                        }
                        
                        HomeHeaderView()
                            .padding(.top, 36)
                            .padding(.bottom, 18)
                        
                        HomeBodyView()
                            .environmentObject(HomeBodyViewModel())
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Image("app.logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                
                        }
                    }
                    .background {
                        Image("app.background")
                    }
                }
            }
        }
        
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
