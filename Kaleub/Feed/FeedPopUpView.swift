//
//  FeedPopUpView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/26.
//

import SwiftUI

struct FeedPopUpView: View {
    @EnvironmentObject var viewModel: FeedViewModel
    
    @State var firstField: String = ""
    @State var secondField: String = ""
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 320, height: 237)
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
                        TextField("", text: $firstField)
                            .multilineTextAlignment(.center)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        if firstField.isEmpty {
                                            Text(viewModel.popUpType.item[2])
                                                .font(.system(size: 12))
                                        }
                                    }
                            }
                            .padding([.horizontal], 27)
                        
                        TextField("", text: $secondField)
                            .multilineTextAlignment(.center)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        if secondField.isEmpty {
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

struct FeedPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        FeedPopUpView()
    }
}
