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
    @Published var feed: Feed? // 피드 상세: 단일 피드
    @Published var room: Room? // TODO: - 화면 전환 시, Room 정보 받아와야 함.
    @Published var feedContent: FeedContent? // 룸에 나타나는 피드 리스트: 룸에서 받아온 정보를 바탕으로 히드 리스트를 세팅
    
    @Published var isShowingRoomInfoEditPopUpView: Bool = false
    @Published var isShowingWriteView: Bool = false
    @Published var isShowingCodeSharePopUpView: Bool = false
    
    /// 공유할 아이템
    @Published var item: ActivityItem?
    
    // MARK: - Write
    @Published var titleText: String = "" // Write페이지에서 title
    @Published var descriptionText: String = "" // Write페이지에서 description
    
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
    
    func detailFeed() {
        let feedId = feedContent!.contents[0].feedId
        Photory.feedDetail(feedId: feedId) { result in
            switch result {
            case .success(let feed):
                self.feed = feed
                break
            case .failure(let error):
                print("🚨Error: \(error.localizedDescription)")
            }
        }
    }
    
    func updateFeed(feedId: Int64, title: String, content: String) {
        let feedId = feedContent!.contents[0].feedId
        Photory.updateFeed(feedId: feedId, title: title, content: content) { result in
            switch result {
            case .success(let feed):
                print("\(feed.content)")
                break
            case .failure(let error):
                print("🚨Error: \(error.localizedDescription)")
            }
        }
    }
}
