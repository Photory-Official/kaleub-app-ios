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
                    viewModel.isShowingFloatingView.toggle()
                    viewModel.popUpType = .join
                    viewModel.isShowingPopUpView.toggle()
                    // TODO: 룸 참여 PopUpView 나타나게 하기
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
                    viewModel.isShowingFloatingView.toggle()
                    viewModel.popUpType = .create
                    viewModel.isShowingPopUpView.toggle()
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
                    viewModel.isShowingFloatingView.toggle()
                } label: {
                    Image("app.floating_button")
                        .resizable()
                        .frame(width: 62, height: 62)
                }
            }
        }
    }
}

struct HomeBodyFloatingView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBodyFloatingView()
    }
}
