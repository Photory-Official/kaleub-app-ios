//
//  FeedViewModel.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/26.
//

import SwiftUI
import Combine

class FeedViewModel: ObservableObject {
    @Published var isShowingPopUpView: Bool = false
    
    var popUpType: PopUpType = .editTitle
    
    enum PopUpType {
        case editPassword
        case editTitle
        
        var item: [String] {
            switch self {
            case .editPassword:
                return [
                    "Edit password",
                    "수정할 비밀번호를 입력해줘",
                    "수정할 비밀번호를 입력해주세요",
                    "수정할 비밀번호를 한번 더 입력해주세요"
                ]
            case .editTitle:
                return [
                    "Edit roomname",
                    "수정할 방 이름을 입력해줘!",
                    "몇 글자 이하로 입력해주세요.",
                    ""
                ]
            }
        }
    }
}
