//
//  HomeBodyViewModel.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI
import Combine
import PhotorySDK

// NOTE: 실제 데이터를 viewModel로 연결하여 사용합니다.
class HomeBodyViewModel: ObservableObject {
    @Published var rooms: [Room] = []
    /// HomeBodyFloatingView를 띄우는 변수
    @Published var showsFloatingView: Bool = false
    /// HomeBodyPopUpView를 띄우는 변수
    @Published var showsPopUpView: Bool = false
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
    
    /// PopView가 나타나 있다면 FloatingView는 나타나지 않는 로직을 구현하는 함수
    func showingFloatingView() {
        showsFloatingView = showsPopUpView
        ? false
        : true
    }
    
    /// popUp 하단의 버튼을 클릭했을 때의 액션
    func didTapConfirmButton(title: String, password: String) {
        guard (4...12) ~= password.count else { return }
        
        
        switch popUpType {
        case .join:
            guard !title.isEmpty else { return }
            // NOTE: - join
        case .create:
            guard (4...6) ~= title.count else { return }
            
            Photory.createRoom(title: title, password: password) { result in
                print("✅ createRoom Success")
                // NOTE: - fetchRoom
                self.showsPopUpView = false
                
                Photory.fetchRoom { result in
                    switch result {
                    case .success(let response):
                        self.rooms = response
                    case .failure(_):
                        print("🚨 error: fetchRoom Error")
                    }
                }
            }
        }
    }
}
