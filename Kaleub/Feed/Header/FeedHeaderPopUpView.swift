//
//  FeedHeaderPopUpView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/26.
//

import SwiftUI

struct FeedHeaderPopUpView: View {
    // NOTE: - AAAAAHHH... 이거 rect가 배경으로 가야했네...
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 320, height: 150)
            .foregroundColor(ColorSet.background)
            .overlay {
                VStack(spacing: 0) {
                    VStack {
                        Spacer()
                        Text("""
                        초대코드를 복사해
                        초대하고 싶은 친구에게
                        보내봐!
                        """)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Divider()
                    }
                    .background(.white)
                    
                    HStack(spacing: 0) {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Text("취소")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                        
                        Divider()
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Text("코드 복사")
                                        .foregroundColor(.black)
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    .frame(height: 52)
                }
                
            }
            
    }
}

struct FeedHeaderPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        FeedHeaderPopUpView()
    }
}
