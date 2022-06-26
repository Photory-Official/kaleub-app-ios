//
//  FeedView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/24.
//

import SwiftUI
import UIKit

struct FeedView: View {
    @EnvironmentObject var viewModel: FeedViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                FeedHeaderView(title: "그해 우리는", password: "123123")
                    .padding([.horizontal], 15)
                    .padding(.bottom, 28)
                
                FeedBodyView()
            }
            .background {
                Image("app.background")
            }
            
            if viewModel.isShowingPopUpView {
                FeedPopUpView()
            }
            
        }
        
        .toolbar {
            // TODO: Custom BackButton
            
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 10) {
                    NavigationLink {
                        
                    } label: {
                        Image("app.trash")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        Image("app.plus")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                }
                
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .environmentObject(FeedViewModel())
    }
}
