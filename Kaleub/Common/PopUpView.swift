//
//  PopUpView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/25.
//

import SwiftUI

struct PopUpView: View {
    var type: PopUpType = .create
    
    enum PopUpType {
        case create // 방 생성
        case join // 방 참여
        case editPassword // 방 비밀번호 수정
        case editName // 방 이름 수정
        
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
            case .editName:
                return [
                    "Edit roomname",
                    "수정할 방 이름을 입력해줘!",
                    "방 이름은 4~6글자 입니다",
                    ""
                ]
            case .editPassword:
                return [
                    "Edit password",
                    "수정할 비밀번호를 입력해줘!",
                    "수정할 방 비밀번호를 입력해주세요.",
                    "수정할 비밀번호를 다시 입력해주세요.",
                ]
            }
        }
    }
    
    @State var firstField: String = ""
    @State var secondField: String = ""
    @Binding var isShowingPopUpView: Bool
    
    init(
        _ type: PopUpType,
        _ isShowingPopUpView: Binding<Bool>
    ) {
        self.type = type
        _isShowingPopUpView = isShowingPopUpView
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 320, height: 237)
                .foregroundColor(.white)
                .overlay {
                    VStack(alignment: .center) {
                        Text(type.item[0])
                            .padding(.top, 20)
                            .padding(.bottom, 12)
                            .font(.system(size: 20))
                        
                        Text(type.item[1])
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 16))
                        
                        // NOTE: TextField 자체에 placeholder 넣어도 되나, font 변경이 가능한 지에 대한 의문.
                        TextField("", text: $firstField)
                            .multilineTextAlignment(.center)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        if firstField.isEmpty {
                                            Text(type.item[2])
                                                .font(.system(size: 12))
                                        }
                                    }
                            }
                            .padding([.horizontal], 27)
                        
                        TextField("", text: $secondField)
                            .multilineTextAlignment(.center)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        if secondField.isEmpty {
                                            Text(type.item[2])
                                                .font(.system(size: 12))
                                        }
                                    }
                            }
                            .padding([.horizontal], 27)
                        
                        Divider()
                        
                        // TODO: 버튼 컬러 넣기
                        HStack(alignment: .center) {
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Button {
                                        print("didTapTouch")
                                        isShowingPopUpView = false
                                    } label: {
                                        Text("취소")
                                    }
                                    Spacer()
                                }
                                    Spacer()
                            }
                            
                            
                            Divider()
                            
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Button {
                                        print("didTapTouch")
                                        isShowingPopUpView = false
                                    } label: {
                                        Text("확인")
                                    }
                                    Spacer()
                                }
                                    Spacer()
                            }
                        }
                        
                        
                        Spacer()
                    }
                }
            
        }
    }
}

struct PopUpView_Previews: PreviewProvider {
    @State static var isShowing: Bool = false
    static var previews: some View {
        PopUpView(.join, $isShowing)
    }
}
