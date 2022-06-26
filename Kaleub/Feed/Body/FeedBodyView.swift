//
//  FeedBodyView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/25.
//

// NOTE: 나중에 UI도 리스트형, 컬렉션 형 등 자유롭게 제공하는 기능이 추가될 수 있고,
// 앱 컨셉에서 사용자가 UI를 자유롭게 커스텀하게 하려고자 함.
// 또한 GridView 사용 코드를 획일화하여 다른 사람도 쉽게 파악하고 작업할 수 있게하기 위함

import SwiftUI

struct FeedBodyView: View {
    @State var type: ColumsType = .standard
    enum ColumsType: CaseIterable {
        case standard
        
        var columns: [GridItem] {
            switch self {
            case .standard:
                return [
                    GridItem(.flexible(), spacing: 0),
                    GridItem(.flexible(), spacing: 0),
                    GridItem(.flexible(), spacing: 0)
                ]
            }
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: type.columns,
                spacing: 0
            ) {
                ForEach((1...4), id: \.self) { n in
                    
                    NavigationLink {
                        // TODO: 다음 페이지로 이동
                        FeedDetailView()
                    } label: {
                        // TODO: 멀티포토 아이콘 배치
                        Image("app.feed" + "\(n)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                    }

                }
            }
            .padding(0)
        }
    }
}
struct FeedBodyView_Previews: PreviewProvider {
    static var previews: some View {
        FeedBodyView()
    }
}
