//
//  FeedCreateView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/26.
//

import SwiftUI

struct FeedCreateView: View {
    
    @State var title: String = ""
    @State var description: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                // TODO: 사진 불러오기
            } label: {
                Image("app.feed1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            
            
            TextField("제목을 입력하세요", text: $title) {
                
            }
            .frame(height: 54)
            
            Divider()
            
            ZStack {
                TextEditor(text: $description)
                    .overlay {
                        if description.isEmpty {
                            Text("내용을 입력하세요")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                    }
            }
            
            Spacer()
            
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("작성하기")
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                if !description.isEmpty && !title.isEmpty {
                    Button {
                        // TODO: server request
                    } label: {
                        Text("완료")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct FeedCreateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedCreateView()
        }
    }
}
