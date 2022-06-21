//
//  SignHeaderField.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct SignHeaderView: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    var body: some View {
        Text(title)
            .padding(.vertical, 100)
    }
}

struct SignHeaderField_Previews: PreviewProvider {
    static let title: String = "SignHeaderView"
    static var previews: some View {
        SignHeaderView(title)
    }
}
