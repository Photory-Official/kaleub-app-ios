//
//  HomeBodyView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct HomeBodyView: View {
    @State var type: ColumsType = .standard
    
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
            
            ScrollView {
                LazyVGrid(columns: type.columns) {
                    HomeBodyGridView(
                        title: "그 해 우리는",
                        date: "3.3.3",
                        participantsCount: 1
                    )
                    HomeBodyGridView(
                        title: "그 해 1",
                        date: "1.1.1",
                        participantsCount: 10
                    )
                    HomeBodyGridView(
                        title: "그 해 우리는",
                        date: "2.2.2",
                        participantsCount: 12
                    )
                }
            }
        }
        .padding([.horizontal], 16)
    }
}

struct HomeBodyView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBodyView()
    }
}
