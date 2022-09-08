//
//  FeedCreateView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/26.
//

import SwiftUI
import PhotorySDK

struct FeedWriteView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: FeedViewModel
    
    @State var showsPhotoLibrary: Bool = false
    @State var image = UIImage(named: "app.feed1") ?? UIImage()
    let type: WriteType
    
    enum WriteType {
        case create
        case update
    }

    init(type: WriteType) {
        self.type = type
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
                        
                        presentationMode.wrappedValue.dismiss()
                        // TODO: update feedId 실제 아이디 사용
                        viewModel.updateFeed(
                            feedId: 1,
                            title: viewModel.feed?.title ?? "",
                            content: viewModel.feed?.content ?? ""
                        )
                    } label: {
                        Text("완료")
                            .foregroundColor(.black)
                    }
                }
                .frame(height: 50)
                .padding([.horizontal], 21)
            }
            
            Image(uiImage: self.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .onTapGesture {
                    showsPhotoLibrary.toggle()
                }
            
            VStack {
                TextField("제목을 입력하세요", text: $viewModel.titleText) {
                    
                }
                .frame(height: 54)
                
                Divider()
                
                ZStack {
                    TextEditor(text: $viewModel.descriptionText)
                        .overlay {
                            if viewModel.descriptionText.isEmpty {
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
        .sheet(isPresented: $showsPhotoLibrary) {
            ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("작성하기")
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                if !viewModel.descriptionText.isEmpty && !viewModel.titleText.isEmpty {
                    Button {
                        // TODO: server request
                        print("didTap 버튼")
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
            FeedWriteView(type: .create)
        }
        
        FeedWriteView(type: .update)
    }
}
