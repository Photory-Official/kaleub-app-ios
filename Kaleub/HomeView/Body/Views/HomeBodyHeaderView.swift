//
//  BodyHeaderView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct HomeBodyHeaderView: View {
    @State var state: SearchState = .close
    @State var text: String = ""
    
    enum SearchState {
        case open
        case close
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Text("MY PHOTO")
            
            Spacer()
            
            if state == .close {
                Button {
                    state = .open
                } label: {
                    Image("app.magnifyingglass")
                        .resizable()
                }
                .frame(width: 24, height: 24)
                .padding(.trailing, 16)
            } else {
                ZStack(alignment: .trailing) {
                    TextFieldView("검색", $text)
                        .frame(height: 24)
                    
                    Button {
                        state = .close
                    } label: {
                        Text("취소")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.trailing, 16)
            }
        }
    }
}

struct BodyHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBodyHeaderView()
    }
}
