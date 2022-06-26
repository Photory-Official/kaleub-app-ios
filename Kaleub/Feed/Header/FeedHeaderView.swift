//
//  FeedHeaderView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/24.
//

import SwiftUI

struct FeedHeaderView: View {
    let title: String
    let password: String
    
    @State var isShowingPopUpView: Bool = false
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.system(size: 28))
                    .frame(height: 28)
                
                // NOTE: 앱적허용,, UI구성 저렇게 하는 방법을 더 고민해 봐야겠습니다.
                Menu {
                    Button {
                        isShowingPopUpView = true
                    } label: {
                        Text("방 이름 수정")
                    }
                    
                    Button {
                        isShowingPopUpView = true
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
                        Image("app.invite.button")
                            .resizable()
                            .frame(width: 48, height: 48, alignment: .center)
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
