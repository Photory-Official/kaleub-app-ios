//
//  FeedCreateView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/26.
//

import SwiftUI

struct FeedWriteView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let type: WriteType
    
    enum WriteType {
        case create
        case update
    }
    
    @State var title: String = ""
    @State var description: String = ""
       
    init(
        _ type: WriteType,
        title: String = "",
        description: String = ""
    ) {
        self.type = type
        _title = State(initialValue: title)
        _description = State(initialValue: description)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if type == .update {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("취소")
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    Text("수정하기")
                    Spacer()
                    
                    Button {
                        // TODO: update feed
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("완료")
                            .foregroundColor(.black)
                    }
                }
                .frame(height: 50)
                .padding([.horizontal], 21)
            }
            
            Button {
                // TODO: 사진 불러오기
            } label: {
                Image("app.feed1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            
            VStack {
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
            }
            .padding([.horizontal], 27)
            
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
            FeedWriteView(.create, title: "", description: "")
        }
        
        FeedWriteView(.update, title: "a", description: "a")
    }
}
