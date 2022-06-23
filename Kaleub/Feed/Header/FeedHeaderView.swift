//
//  FeedHeaderView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/24.
//

import SwiftUI

struct FeedHeaderView: View {
    let title: String = ""
    let password: String = ""
    
    var body: some View {
        VStack {
            Text(title)
        }
    }
}

struct FeedHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FeedHeaderView()
    }
}
