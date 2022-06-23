//
//  HomeBodyFloatingView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/23.
//

import SwiftUI

struct HomeBodyFloatingView: View {
    @EnvironmentObject var viewModel: HomeBodyViewModel
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            
            if viewModel.isShowingFloatingView {
                Button {
                    didTapFloatingMenu(.join)
                } label: {
                    RoundedRectangle(cornerRadius: 60)
                        .foregroundColor(ColorSet.primary)
                        .frame(width: 172, height: 48)
                        .overlay {
                            Text("JOIN THE ROOM")
                                .foregroundColor(.black)
                        }
                }
                
                Button {
                    didTapFloatingMenu(.create)
                } label: {
                    RoundedRectangle(cornerRadius: 60)
                        .foregroundColor(ColorSet.primary)
                        .frame(width: 172, height: 48)
                        .overlay {
                            Text("CREATE A ROOM")
                                .foregroundColor(.black)
                        }
                }
            }
            
            HStack {
                Spacer()
                
                Button {
                    viewModel.showingFloatingView()
//                    viewModel.isShowingFloatingView = true
                } label: {
                    Image("app.floating_button")
                        .resizable()
                        .frame(width: 62, height: 62)
                }
            }
        }
    }
    
    func didTapFloatingMenu(_ type: HomeBodyViewModel.PopUpType) {
        viewModel.isShowingFloatingView = false
        
        viewModel.popUpType = type
        viewModel.isShowingPopUpView = true
    }
}

struct HomeBodyFloatingView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBodyFloatingView()
    }
}
