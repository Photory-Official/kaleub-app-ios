//
//  HomeBodyView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct HomeBodyView: View {
    @State var type: ColumsType = .standard
    
    @State var isShowing: Bool = true
    
    // NOTE: 나중에 UI도 리스트형, 컬렉션 형 등 자유롭게 제공하는 기능 추가 예정
    enum ColumsType: CaseIterable {
        case standard
        
        var columns: [GridItem] {
            switch self {
            case .standard:
                return [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
            }
        }
    }
    
    var body: some View {
        
        VStack {
            HomeBodyHeaderView()
            
            
            // MARK: - contents
            
            ScrollView {
                LazyVGrid(columns: type.columns) {
                    // TODO: 데이터 연결하고 ForEach로 변경합니다.
                    
                    HomeBodyGridView(
                        title: "그 해 우리는",
                        date: "3.3.3",
                        participantsCount: 1
                    )
                }
            }
            .shadow(color: ColorSet.shadowColor, radius: 4, x: 0, y: 4)
            .overlay {
                HomeBodyFloatingView()
            }
            
            Divider()
            
            Spacer()
        }
        .padding([.horizontal], 16)
        
    }
}

struct HomeBodyView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBodyView()
        
    }
}

//Image("app.empty")
//    .resizable()
//    .aspectRatio(contentMode: .fit)


