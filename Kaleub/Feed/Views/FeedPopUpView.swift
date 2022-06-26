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
    var rectangleHeight: Double {
        if viewModel.popUpType == .editPassword {
            return 230
        } else {
            return 190
        }
    }
    var opacity: Double {
        if viewModel.popUpType == .editPassword {
            return 1
        } else {
            return 0
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 320, height: rectangleHeight)
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
                            .frame(height: 34)
                            .multilineTextAlignment(.center)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        if firstField.isEmpty {
                                            Text(viewModel.popUpType.item[1])
                                                .font(.system(size: 12))
                                        }
                                    }
                            }
                            .padding([.horizontal], 27)
                            
                        if viewModel.popUpType == .editPassword {
                            TextField("", text: $secondField)
                                .frame(height: 34)
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
                        }
                        
                        Spacer()
                        
                        HStack {
                            Button {
                                viewModel.isShowingPopUpView = false
                            } label: {
                                Text("취소")
                                    .foregroundColor(.gray)
                            }
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: 52,
                                alignment: .center
                            )
                            
                            Button {
                                viewModel.isShowingPopUpView = false
                                // TODO: Request Server
                                
                            } label: {
                                Text("확인")
                                    .foregroundColor(.black)
                            }
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: 52,
                                alignment: .center
                            )
                        }
                    }
                }
        }
    }
}

struct FeedPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        FeedPopUpView()
            .environmentObject(FeedViewModel())
    }
}

// NOTE: - Legacy

//Button {
//    viewModel.isShowingPopUpView = false
//    print("didTapTouchButton")
//} label: {
//    Image("app.xmark")
//        .resizable()
//        .frame(width: 24, height: 24)
//        .padding(18)
//}

