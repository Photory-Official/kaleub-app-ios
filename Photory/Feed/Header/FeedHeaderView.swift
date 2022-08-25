//
//  FeedHeaderView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/24.
//

import SwiftUI

struct FeedHeaderView: View {
    @EnvironmentObject var viewModel: FeedViewModel
    
    let title: String
    let password: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.system(size: 28))
                    .frame(height: 28)
                
                // NOTE: UIBezier사용해서 구현 가능할 듯
                Menu {
                    // FIXME: - 방이름 부분은 서버에서 구현되지 않았습니다. 나중에 결제 구현하면서 유료로
//                    Button {
//                        viewModel.popUpType = .editTitle
//                        viewModel.isShowingRoomInfoEditPopUpView = true
//                    } label: {
//                        Text("방 이름 수정")
//                    }
                    
                    Button {
                        viewModel.popUpType = .editPassword
                        viewModel.isShowingRoomInfoEditPopUpView = true
                    } label: {
                        Text("비밀번호 수정")
                    }
                } label: {
                    Image("app.setting")
                        .resizable()
                        .frame(width: 16, height: 16)
                }

                Spacer()
            }
            
            
            VStack(alignment: .leading) {
                // TODO: Color 조정, HexColor SPM 만들어서 사용할 예정.
                Text(password)
                    .font(.system(size: 14))
                
                
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        // TODO: 실제 데이터 연결 후 ForEach로 전환예정
                        Image("app.profile2")
                            .resizable()
                            .frame(width: 48, height: 48, alignment: .center)
                        
                        Image("app.profile1")
                            .resizable()
                            .frame(width: 48, height: 48, alignment: .center)
                        
                        // NOTE: 마지막에는 무조건 invite이미지
                        Button {
                            // TODO: 초대코드 복사
                            viewModel.isShowingCodeSharePopUpView.toggle()
                        } label: {
                            Image("app.invite.button")
                                .resizable()
                                .frame(width: 48, height: 48, alignment: .center)
                        }
                    }
                }
            }
            
        }
    }
}

struct FeedHeaderView_Previews: PreviewProvider {
    static let title = "그 해 우리는"
    static let password = "khg1kls801mga"
    
    static var previews: some View {
        FeedHeaderView(title: title, password: password)
    }
}
