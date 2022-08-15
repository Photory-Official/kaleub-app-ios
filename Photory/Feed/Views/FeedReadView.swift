//
//  FeedDetailView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/25.
//

import SwiftUI

struct FeedReadView: View {
    @EnvironmentObject var viewModel: FeedViewModel
      
    // TODO: 나중에 ViewModel로 이동할 예정
    let date: String = "2022년 06월 30일"
    let title: String = "그 해 우리는 짱"
    let description: String = "나는 지금 그해우리는 프로젝트에 참여하고 있음 움하하"
    
    var body: some View {
        VStack {
            Image("app.feed1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // NOTE: - UIPageControl
            HStack {
                // TODO: 실제 데이터 연결 후 UI 하나만 fill로 구현
                ForEach((0...4), id: \.self) { _ in
                    Circle()
                        .frame(width: 6, height: 6)
                }
            }
            
            // TODO: - Diverder에 색상을 넣고 코드를 더 간결하게 개선합니다.
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(.system(size: 20))
                    .padding(.leading, 6.5)
                    .padding(.top, 14)
                    .padding(.bottom, 12)
                
                Divider()
                
                Text(description)
                    .font(.system(size: 16))
                    .padding(.leading, 6.5)
                    .padding(.top, 14)
                
            }
            .padding([.horizontal], 20.5)
            
            Spacer()
        }
        .fullScreenCover(isPresented: $viewModel.isShowingWriteView) {
            FeedWriteView(.update, title: title, description: description)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(date)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                // TODO: 텍스트 컬러 색 변경하기
                Menu {
                    Button {
                        // TODO: 이거 띄우기
                        viewModel.isShowingWriteView.toggle()
                    } label: {
                        Text("수정하기")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("삭제하기")
                    }
        
                } label: {
                    Image("app.union")
                        .resizable()
                        .frame(width: 20, height: 4)
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                }
            }
        }
    }
}

struct FeedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
            FeedReadView()
        }
    }
}
