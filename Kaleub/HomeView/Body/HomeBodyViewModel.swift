//
//  HomeBodyViewModel.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

// NOTE: 실제 데이터를 viewModel로 연결하여 사용합니다.
class HomeBodyViewModel: ObservableObject {
    /// HomeBodyFloatingView를 띄우는 변수
    @Published var isShowingFloatingView: Bool = false
    /// HomeBodyPopUpView를 띄우는 변수
    @Published var isShowingPopUpView: Bool = false
    /// HomeBodyPopUpView의 타입을 정하는 변수
    var popUpType: PopUpType = .create
    enum PopUpType {
        case create
        case join
        
        var item: [String] {
            switch self {
            case .create:
                return [
                    "CREATE THE ROOM",
                    "새로운 방을 만들어\n친구를 초대하자!",
                    "방 제목을 입력해 주세요. (4~6)",
                    "비밀번호를 설정해주세요. (4~12)"
                ]
            case .join:
                return [
                    "JOIN THE ROOM",
                    "친구들과 추억이 담긴 방\n참여해 볼 수 있어!",
                    "초대코드를 입력해 주세요.",
                    "비밀번호를 입력해 주세요.(4~12)"
                ]
            }
        }
    }
}
