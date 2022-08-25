//
//  View.Photory.swift
//  Photory
//
//  Created by Hamlit Jason on 2022/08/25.
//

import SwiftUI

extension View {
    /**
     관련`ActivityItem`이 존재할 때, 해당하는 activity sheet를 보여줍니다.
     
     - Parameters:
       - item: activity에 사용할 아이템입니다.
       - onComplete: sheet가 dimiss되었을 때, 결과과 호출됩니다.
     */
    func activitySheet(_ item: Binding<ActivityItem?>, permittedArrowDirections: UIPopoverArrowDirection = .any, onComplete: UIActivityViewController.CompletionWithItemsHandler? = nil) -> some View {
        background(ActivityView(item: item, permittedArrowDirections: permittedArrowDirections, onComplete: onComplete))
    }
}
