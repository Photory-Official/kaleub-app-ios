//
//  HomeBodyPopUpView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/23.
//

import SwiftUI

struct HomeBodyPopUpView: View {
    @EnvironmentObject var viewModel: HomeBodyViewModel
    
    @State var name: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 320, height: 205)
                .foregroundColor(.white)
                .overlay {
                    VStack(alignment: .center) {
                        Text(viewModel.popUpType.item[0])
                            .padding(.top, 20)
                            .padding(.bottom, 12)
                            .font(.system(size: 20))
                        
                        Text(viewModel.popUpType.item[1])
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 16))
                        
                        // NOTE: TextField 자체에 placeholder 넣어도 되나, font 변경이 가능한 지에 대한 의문.
                        TextField("", text: $name)
                            .multilineTextAlignment(.center)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        if name.isEmpty {
                                            Text(viewModel.popUpType.item[2])
                                                .font(.system(size: 12))
                                        }
                                    }
                            }
                            .padding([.horizontal], 27)
                        
                        TextField("", text: $password)
                            .multilineTextAlignment(.center)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        if password.isEmpty {
                                            Text(viewModel.popUpType.item[2])
                                                .font(.system(size: 12))
                                        }
                                    }
                            }
                            .padding([.horizontal], 27)
                        
                        Spacer()
                    }
                }
            
            Button {
                // TODO: cancel
                viewModel.isShowingPopUpView = false
                print("didTapTouchButton")
            } label: {
                Image("app.xmark")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(18)
            }
            
        }
        
    }
}

struct HomeBodyPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBodyPopUpView()
            .environmentObject(HomeBodyViewModel())
    }
}
