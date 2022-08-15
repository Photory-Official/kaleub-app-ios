//
//  HomeView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct HomeView: View {
    // NOTE: HomeViewModel을 사용할 경우 앱이 커지면서 viewModel이 뚱뚱해질 것 같아서, 미리 분리
    var body: some View {
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
