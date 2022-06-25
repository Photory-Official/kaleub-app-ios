//
//  FeedDetailView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/25.
//

import SwiftUI

struct FeedDetailView: View {
    var body: some View {
        VStack {
            Image("app.feed1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // NOTE: - PageControl
            HStack {
                // TODO: 실제 데이터 연결 후 UI 하나만 fill로 구현
                ForEach((0...4), id: \.self) { _ in
                    Circle()
                        .frame(width: 6, height: 6)
                }
            }
            
            Spacer()
        }
    }
}

struct FeedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetailView()
    }
}
