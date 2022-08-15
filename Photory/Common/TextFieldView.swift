//
//  TextFieldView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/21.
//

import SwiftUI

struct TextFieldView: View {
    
    var title: String
    @Binding var text: String
    
    init(_ title: String, _ text: Binding<String>) {
        self.title = title
        _text = text
    }
    
    var body: some View {
        HStack {
            VStack {
                TextField(title, text: $text)
                Divider()
                    .border(.black, width: 1)
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    @State static var text: String = ""
    
    static var previews: some View {
        TextFieldView("텍스트 필드 타이틀", $text)
    }
}
