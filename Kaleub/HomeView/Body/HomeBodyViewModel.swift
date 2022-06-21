//
//  HomeBodyViewModel.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import Foundation

class HomeBodyViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var date: String = ""
    @Published var participantsCount: Int = 1
}
