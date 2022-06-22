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


    /*  NOTE: background vs overlay
     background: 해당 뷰보다 뒤에 위치
     overlay: 해당 뷰보다 앞에 위치
     overlay하면 텍스트필드가 안먹힐 수 있다.
     */
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
                        TextField("", text: $name)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        Text(viewModel.popUpType.item[2])
                                            .font(.system(size: 12))
                                    }
                            }
                            .padding([.horizontal], 27)
                        TextField("", text: $password)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        Text(viewModel.popUpType.item[3])
                                            .font(.system(size: 12))
                                    }
                            }
                            .padding([.horizontal], 27)
                        
                        Spacer()
                    }
                }
            
            Button {
                // TODO: cancel
                viewModel.isShowingPopUpView.toggle()
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
    }
}
