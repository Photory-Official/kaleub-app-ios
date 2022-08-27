//
//  FeedViewModel.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/26.
//

import SwiftUI
import Combine
import PhotorySDK

class FeedViewModel: ObservableObject {
    @Published var feed: Feed?
    @Published var room: Room? // TODO: - 화면 전환 시, Room 정보 받아와야 한다.
    @Published var feedContent: FeedContent?
    
    @Published var isShowingRoomInfoEditPopUpView: Bool = false
    @Published var isShowingWriteView: Bool = false
    @Published var isShowingCodeSharePopUpView: Bool = false
    
    /// 공유할 아이템
    @Published var item: ActivityItem?
    
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
    
    // 비밀번호 수정
    func changeRoomPassword(beforePassword: String, afterPassword: String) {
        guard let feed = feed else {
            print("🚨Error: Feed nil")
            return
        }

        Photory.changePasswordRoom(roomId: feed.roomId, beforePassword: beforePassword, afterPassword: afterPassword) { result in
            switch result {
            case .success():
                // NOTE: - 성공
                print("✅ 비밀번호 변경을 성공했어요.")
            case .failure(let error):
                // NOTE: - 실패
                print("🚨Error \(error.localizedDescription)")
            }
        }
    }
    
    // FIXME: - 방이름 수정(서버 미구현)
    func changeRoomTitle() { }
    
    // 초대코드
    func share() {
        print("\(#function)")
        let roomId = room?.id
        let password = room?.password
        let items: String = """
            안녕하세요. 초대코드가 도착했어요.
            🌿 방이름: \(roomId)
            🌿 방 비밀번호: \(password)
        """
        item = ActivityItem(items: items)
    }
}
