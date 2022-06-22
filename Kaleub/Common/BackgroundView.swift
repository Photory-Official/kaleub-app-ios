//
//  BackgroundView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct BackgroundView: View {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static let name = "background"
    static var previews: some View {
        BackgroundView(name)
    }
}
